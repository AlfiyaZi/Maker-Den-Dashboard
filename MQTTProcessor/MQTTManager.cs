﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace MQTTProcessor {
    public class MQTTManager {
        //const string MqttBroker = "test.mosquitto.org";//"10.86.105.236";
        string mqttBrokerName;
        string mqttClientId = Guid.NewGuid().ToString().Substring(0, 18);
        string mqttTopic;
        MqttClient client;

        public delegate void DataEventHandlert(object sender, EventArgs e);

        public event DataEventHandlert OnDataEvent;

        public class DataEventArgs : EventArgs {
            public readonly Fact fact;
            public readonly string data;
            public DataEventArgs(Fact fact, string data) {
                this.fact = fact;
                this.data = data;
            }
        }


        private void InitDataEvent(EventArgs e) {
            if (OnDataEvent != null) { OnDataEvent(this, e); }
        }

        public MQTTManager(string mqttBrokerName, string mqttTopic, bool start) {
            this.mqttBrokerName = mqttBrokerName;
            this.mqttTopic = mqttTopic;

            InitMQTT();
            if (start) { ConnectMqtt(); }
        }

        public void InitMQTT() {

            InitBroker();
        }

        void InitBroker() {
            bool connected = false;
            int retryCount = 0;
            while (!connected && retryCount < 2) {
                try {
                    client = new MqttClient(mqttBrokerName);
                    connected = true;
                }
                catch {
                    Console.WriteLine("Problem connecting, check the broker address");
                    Thread.Sleep(2000);
                    retryCount++;
                }
            }
            if (!connected) {
                client = null;
                throw new Exception("Problem connecting to " + mqttBrokerName + ".  Check address is correct");
            }
        }

        void ConnectMqtt() {
            while (!client.IsConnected) {
                try {
                    client.Connect(mqttClientId);
                }
                catch {
                    Console.WriteLine("Problem connecting, check the broker address");
                    Thread.Sleep(5000);
                }
            }

            client.MqttMsgPublishReceived += client_MqttMsgPublishReceived;
            client.ConnectionClosed += client_MqttMsgDisconnected;

            // subscribe to the topic "/home/temperature" with QoS 2 
            client.Subscribe(new string[] { mqttTopic, "gbdevice/#" }, new byte[] { MqttMsgBase.QOS_LEVEL_AT_MOST_ONCE, MqttMsgBase.QOS_LEVEL_AT_MOST_ONCE });

        }

        void client_MqttMsgDisconnected(object sender, EventArgs e) {
            if (client != null) {
                client.MqttMsgPublishReceived -= client_MqttMsgPublishReceived;
                client.ConnectionClosed -= client_MqttMsgDisconnected;
                client = null;
            }

            InitMQTT();
            ConnectMqtt();
        }

        void client_MqttMsgPublishReceived(object sender, uPLibrary.Networking.M2Mqtt.Messages.MqttMsgPublishEventArgs e) {
            string data = BytesToString(e.Message);
            SendMessage(data, e.Topic);
        }


        public void Connect() {
            if (client != null) {
                ConnectMqtt();
            }
        }

        public void Disconnect() {
            if (client != null) {
                try {
                    client.Disconnect();
                }
                catch { }
            }
        }

        public static string BytesToString(byte[] Input) {
            char[] Output = new char[Input.Length];
            for (int Counter = 0; Counter < Input.Length; ++Counter) {
                Output[Counter] = (char)Input[Counter];
            }
            return new string(Output);
        }

        void SendMessage(string data, string topic) {
            string[] topicParts = topic.Split('/');
            if (topicParts.Length < 1) { return; }
            try {
                switch (topicParts[0]) {
                    case "gbdevice":
                        break;
                    default:
                        Fact f = JsonConvert.DeserializeObject<Fact>(data);
                        ProcessMessage(f, data, topic);
                        break;
                }
            }
            catch (Exception ex) {

            };
        }

        public virtual void ProcessMessage(Fact fact, string data, string topic) {
            fact.Topic = topic;
            InitDataEvent(new DataEventArgs(fact, data));
        }

        public void Publish(string topic, string SelectedCommand) {
            if (client != null) {
                client.Publish(topic, new UTF8Encoding().GetBytes(SelectedCommand));
            }
        }
    }
}

