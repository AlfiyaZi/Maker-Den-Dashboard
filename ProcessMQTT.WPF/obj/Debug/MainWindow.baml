   M S B A M L   `   `   `  ����G  CIoTDashboard, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:ProcessMQTT.WPF.ValueConvertersProcessMQTT.WPF.ValueConverters  5   	        ProcessMQTT.WPF.MainWindow   5   	   b ^Telerik.Windows.Data, Version=2014.3.1021.45, Culture=neutral, PublicKeyToken=5803cfa389c90ce7l hTelerik.Windows.Controls.Input, Version=2014.3.1021.45, Culture=neutral, PublicKeyToken=5803cfa389c90ce7x tTelerik.Windows.Controls.DataVisualization, Version=2014.3.1021.45, Culture=neutral, PublicKeyToken=5803cfa389c90ce7f bTelerik.Windows.Controls, Version=2014.3.1021.45, Culture=neutral, PublicKeyToken=5803cfa389c90ce7Etelerik1http://schemas.telerik.com/2008/xaml/presentation     R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   IValueConverters-clr-namespace:ProcessMQTT.WPF.ValueConverters     5   	     � Title$"  Internet of Things Dashboard��5   	   $	��750��6.   $
��1000��6;    � WindowStartupLocation$ CenterScreen=�6H    � SizeToContent$ Manual=�6m    � WindowState$ 	Maximized=�6�    � WindowStyle$ SingleBorderWindow=�6�    � 	Resources 5      D   >ProcessMQTT.WPF.ValueConverters.BoolToVisibilityValueConverter "  BoolToVisibilityValueConverter>   8ProcessMQTT.WPF.ValueConverters.UtcToLocalValueConverter  UtcToLocalValueConverterK   EProcessMQTT.WPF.ValueConverters.TopicToBackgroundColourValueConverter ) %TopicToBackgroundColourValueConverterA   ;ProcessMQTT.WPF.ValueConverters.FactTypeRangeValueConverter  FactTypeRangeValueConverter  SensorItemTemplate �� 	Converter � ColumnDefinitions �� StringFormat-  'Telerik.Windows.Controls.RadRadialGauge+  %Telerik.Windows.Controls.StyleManager	   Theme-  'Telerik.Windows.Controls.ThemeConverter0  *Telerik.Windows.Controls.Gauge.RadialScale1	  +Telerik.Windows.Controls.Gauge.GraphicScale
 	  LabelFormat.
  (Telerik.Windows.Controls.Gauge.ScaleBase
 
  Min �� ConverterParameter
 
  Max 
  
Indicators+  %Telerik.Windows.Controls.Gauge.Needle9  3Telerik.Windows.Controls.Gauge.InteractiveIndicator   
IsAnimated5  /Telerik.Windows.Controls.Gauge.GraphicIndicator   Value+  %Telerik.Windows.Controls.Gauge.Marker   RefreshMode   RefreshRate  GaugeItemsPanelTemplate K� IsItemsHost $� Orientation��%  &	        &	      &	 &     &	 9     &	 L     7  7  7  7  &	 �      5   
   69     5   
   63     5	   
   6@     5
   
   66   �� 5   
   .R�5      � $��0q�6   ��6   �� *Topic+8    5      �� 5      $��* �6'   .+�5      �� 
���   �$��1q�6-   $��2��6A   �� 5      $��4q�6   $
��Left=�6(   .+�5      �� $��18(�67   $	��140��6E   ��6    �� *Topic+6E   �� 5      ��6    �� *LastUpdated+8  $ {0:dd/MM/yyyy HH:mm:ss}��  5      $	��140��6-   $	 Windows8 6;   $	��140��6a   $��0,2,0,0q�6m   .@�5        $
 {0:F0}��5   .    5   .   �� *Type+$	 min��8   5   .   �� *Type+$	 max��8   5        5   "    .  61   �� *Val+6G     5   "    .  61   �� *Avg+6G     5   "    . $	 Max=�6Y   $ 0:0:30h�6k   
��� � �
��� � � 61   �� *Val+6�     5   "    . $	 Min=�6Y   $ 0:0:30h�6k   
���  ��
���  �� 61   �� *Val+6�   5      5      5'      5(      5)      �� 5*   
   .R�5+      $�  . $ 
Horizontal=�68   5,      5-      .��5/      �  � RowDefinitions 50   
   �� 51      $
��Auto �6   �� 52      $
��Auto �6   �� 53      $��* �6   �� 54      $
��Auto �6   �� 55      $
��Auto �6   .+�57   
   o� .@�58      m� $��_File��6   .@�59      m� $��	_Settings��6    m� Command 6.   �� *ShowSettingsPaneCommand+�� 5:      m� 5;      -   5        $��_Exit��5;      6*   5<      5=      �� 5?   
   $��Images/IoTWorld.png��6   $��UniformToFill=�6-   $��2��6E    J� Opacity$	 0.5Q�6V   $��1��6d   �� 5A   
   $"��Internet of Things Dashboard��6   $��30(�68   $��Bottom=�6F   $��5q�6a   $��1��6l   �� 5B   
   $��Controls by Telerik��6   $��Right=�6/   $��Bottom=�6K   $��15(�6f   $��5q�6t   $��1��6   �� 5C   
   $��2��6   #���  6?   $��Disabled=�6s   
������ ��6   �� *	Sensors+��5D      �� 5E      .R�5F      �  .  � Orientation$ 
Horizontal=�63   5G      5I      � 5J   
   $��3��6    5K      �� 5L      $��* �6#   �� 5M      $��* �6#   �� 5N      $��* �6#   .+�5P      2  ,Telerik.Windows.Controls.RadWatermarkTextBox  $��0��6*      WatermarkContent$ 	Device ID��6a   $��10q�6~   $��20(�6�   $��Stretch=�6�   ��6:   �� *
DeviceID+ �� Mode$ TwoWay=�6�   *  $Telerik.Windows.Controls.RadComboBox  5Q      $��1��6"   $��10q�62   $��20(�6>   $��Stretch=�6�      
IsEditable . ��6L   �� *
Commands+   Text 6m   �� *SelectedCommand+$ TwoWay=�6�   �� 5R      -   5        $��2��5R      $
��Post��6%   $��10q�64   $��20(�6@   6N   5S      �� 5T   
    �� Orientation$ 
Horizontal=�6   $��4��6.   $y�	Collapsed=�6;   .+�5U      �� $��Total stats recorded:��6   $��10q�65   $��20(�6A   �� 5V      $��10q�6R   $��20(�6^   ��6   �� *
LightCount+$ Light: {0:N0}��6^   �� 5W      $��10q�6P   $��20(�6\   ��6   �� *	TempCount+$ Temp: {0:N0}��6\   �� 5X      $��10q�6R   $��20(�6^   ��6   �� *
SoundCount+$ Sound: {0:N0}��6^   5Y      � 5Z   
   $��4��6    � DataContext 6    �� *
SettingsVM+y�6C   �� *	Visible+# [   5[      �� 5\      $��* �6#   �� 5]      $	��360 �6#   .+�5_      �� $��0��6   ���	#7F000000 J� InputBindings 5`      d� 5a        d� MouseAction$  	LeftClicke�6#   ! �� Command! 6;   �� *HideSettingsCommand+5c      �� 5d      $��1��6   
�������6%   �� 5e      $��1��6   $��10q�6)   .+�5f      �� $��Settings��6   $��24(�6,   $��0,0,0,30q�6:   
�������6L   �� 5g      $��MQTT Broker Address��6   $��16(�67   $��0,0,0,5q�6E   
�������6V   �� 5h      $��16(�6=   $��0,0,0,10q�6K   ��6   �� *MqttBrokerAddress+6K   �� 5i      $��
MQTT Topic��6   $��16(�6.   $��0,0,0,5q�6<   
�������6M   �� 5j      $��16(�65   $��0,0,0,10q�6C   ��6   �� *	MqttTopic+6C   �� 5k      $��Right=�6   $��Defaults��65   $��16(�6H   $��5q�6V   ��6b   �� *DefaultSettingsCommand+5l      �� 5m      
�������$��Right=�6(   $��Bottom=�6D   $��Ok��6_   $��24(�6l   $��10q�6�   $��1��6�   
������ 
�������$��5q�6�   ��6z   �� *HideSettingsCommand+6�   5n      5o      5p      