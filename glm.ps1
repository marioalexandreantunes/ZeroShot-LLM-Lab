# 1. Load required WPF Assemblies
Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

# 2. Define the XAML for the MainWindow
# This defines the layout, styles, and controls as requested.
[xml]$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Mario Antunes"
        Height="400" Width="600"
        ResizeMode="CanResize"
        SnapsToDevicePixels="True"
        WindowStartupLocation="CenterScreen"
        WindowStyle="None"
        AllowsTransparency="True"
        Background="Transparent"
        Foreground="{DynamicResource FgColor}">
    
    <Window.Resources>
        <!-- Define Styles for a consistent Dark Mode look using DynamicResource references -->
        
        <!-- Simple Dark Button Style -->
        <Style TargetType="Button" x:Key="DarkButton">
            <Setter Property="Background" Value="{DynamicResource SecondaryButtonBg}"/>
            <Setter Property="Foreground" Value="{DynamicResource FgColor}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource ButtonBorderColor}"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Padding" Value="15,5"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border Background="{TemplateBinding Background}" 
                                BorderBrush="{TemplateBinding BorderBrush}" 
                                BorderThickness="{TemplateBinding BorderThickness}"
                                CornerRadius="3">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="{DynamicResource SecondaryButtonHover}"/>
                </Trigger>
                <Trigger Property="IsPressed" Value="True">
                    <Setter Property="Background" Value="{DynamicResource SecondaryButtonPressed}"/>
                </Trigger>
            </Style.Triggers>
        </Style>

        <!-- Simple Dark Checkbox Style -->
        <Style TargetType="CheckBox">
            <Setter Property="Foreground" Value="{DynamicResource FgColor}"/>
            <Setter Property="Background" Value="{DynamicResource CheckBoxBgColor}"/>
            <Setter Property="BorderBrush" Value="{DynamicResource CheckBoxBorderColor}"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <StackPanel Orientation="Horizontal" Background="Transparent">
                            <Border x:Name="checkBoxBorder" 
                                    Width="18" Height="18" 
                                    CornerRadius="3"
                                    Background="{TemplateBinding Background}"
                                    BorderBrush="{TemplateBinding BorderBrush}"
                                    BorderThickness="1"
                                    Margin="0,0,8,0">
                                <Path x:Name="checkMark" 
                                      Data="M 0 5 L 4 9 L 10 0" 
                                      Stroke="{DynamicResource AccentColor}" 
                                      StrokeThickness="2"
                                      Stretch="Uniform"
                                      Margin="3"
                                      Visibility="Collapsed"/>
                            </Border>
                            <ContentPresenter VerticalAlignment="Center"/>
                        </StackPanel>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="checkMark" Property="Visibility" Value="Visible"/>
                            </Trigger>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="checkBoxBorder" Property="Background" Value="{DynamicResource CheckBoxHoverColor}"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <!-- Main Container Border (Visual Window) -->
    <Border Background="{DynamicResource BgColor}" 
            BorderBrush="{DynamicResource BorderColor}" 
            BorderThickness="1" 
            CornerRadius="5">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="*"/>
                <!-- Main Content Area -->
                <RowDefinition Height="Auto"/>
                <!-- Bottom Button Area -->
            </Grid.RowDefinitions>

            <!-- Centered Checkbox -->
            <CheckBox Content="available?" 
                      HorizontalAlignment="Center" 
                      VerticalAlignment="Center"
                      FontSize="16"/>

            <!-- Bottom Button Area -->
            <StackPanel Grid.Row="1" Orientation="Horizontal" HorizontalAlignment="Center" Margin="0,0,0,20">
                <Button Content="run" Style="{StaticResource DarkButton}" Width="80" Height="30"/>
            </StackPanel>
            
            <!-- Resize Grip (Allows resizing since WindowStyle is None) -->
            <Grid HorizontalAlignment="Right" VerticalAlignment="Bottom" Grid.Row="1">
                <Path Data="M0.5,10.5 L10.5,0.5 M4.5,10.5 L10.5,4.5 M8.5,10.5 L10.5,8.5" 
                      Stroke="{DynamicResource BorderColor}" 
                      StrokeThickness="1" 
                      Margin="3"/>
            </Grid>
        </Grid>
    </Border>
</Window>
"@

# 3. Parse XAML and create the Window object
 $reader = (New-Object System.Xml.XmlNodeReader $xaml) 
 $window = [Windows.Markup.XamlReader]::Load($reader)

# 4. Add the Color Palette Resources
# These are added programmatically as requested. 
# Because the XAML uses DynamicResource, the window will update instantly once these are added.

 $window.Resources.Add("BgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#202020")))
 $window.Resources.Add("FgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFFFFF")))
 $window.Resources.Add("CardBgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#2b2b2b")))
 $window.Resources.Add("BorderColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#404040")))
 $window.Resources.Add("ButtonBorderColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#404040")))
 $window.Resources.Add("CheckBoxBgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#272727")))
 $window.Resources.Add("CheckBoxBorderColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#808080")))
 $window.Resources.Add("CheckBoxHoverColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#343434")))
 $window.Resources.Add("ComboBgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#373737")))
 $window.Resources.Add("ComboHoverColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#434343")))
 $window.Resources.Add("ComboItemBgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#2c2c2c")))
 $window.Resources.Add("ComboItemHoverColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#383838")))
 $window.Resources.Add("ComboItemSelectedColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#343434")))
 $window.Resources.Add("AccentColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFD700")))
 $window.Resources.Add("ButtonDisabled", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#434343")))
 $window.Resources.Add("ButtonTextDisabled", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#989898")))
 $window.Resources.Add("SecondaryButtonBg", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#393939")))
 $window.Resources.Add("SecondaryButtonHover", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#2a2a2a")))
 $window.Resources.Add("SecondaryButtonPressed", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#1e1e1e")))
 $window.Resources.Add("SecondaryButtonDisabled", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#3b3b3b")))
 $window.Resources.Add("SecondaryButtonTextDisabled", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#787878")))
 $window.Resources.Add("InputFocusColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#1f1f1f")))
 $window.Resources.Add("ScrollBarThumbColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#3d3d3d")))
 $window.Resources.Add("ScrollBarThumbHoverColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#4b4b4b")))
 $window.Resources.Add("TitlebarButtonHover", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#2d2d2d")))
 $window.Resources.Add("TitlebarButtonPressed", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#292929")))
 $window.Resources.Add("AppIdColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#afafaf")))
 $window.Resources.Add("SearchHighlightColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#4A4A2A")))
 $window.Resources.Add("SearchHighlightActiveColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#8A7000")))
 $window.Resources.Add("TableHeaderColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#333333")))

# 5. Enable Window Dragging (since WindowStyle is None)
# We find the main Border container and attach the drag logic to it.
 $border = $window.Content
if ($border -is [System.Windows.Controls.Border]) {
    $border.Add_MouseLeftButtonDown({
        param($s, $e)
        if ($e.Source -eq $s) {
            $window.DragMove()
        }
    })
}

# 6. Show the Window
 $window.ShowDialog() | Out-Null