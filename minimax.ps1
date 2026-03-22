# Mario Antunes - Pure PowerShell WPF Application
# No compilation required - runs directly from PowerShell

Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows

# Define the XAML inline
$Xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Mario Antunes"
        Width="600"
        Height="400"
        ResizeMode="CanResize"
        SnapsToDevicePixels="True"
        WindowStartupLocation="CenterScreen"
        WindowStyle="None"
        AllowsTransparency="True"
        Background="Transparent">

    <Window.Resources>
        <SolidColorBrush x:Key="BgColor" Color="#202020"/>
        <SolidColorBrush x:Key="FgColor" Color="#FFFFFF"/>
        <SolidColorBrush x:Key="CardBgColor" Color="#2b2b2b"/>
        <SolidColorBrush x:Key="BorderColor" Color="#404040"/>
        <SolidColorBrush x:Key="ButtonBorderColor" Color="#404040"/>
        <SolidColorBrush x:Key="CheckBoxBgColor" Color="#272727"/>
        <SolidColorBrush x:Key="CheckBoxBorderColor" Color="#808080"/>
        <SolidColorBrush x:Key="CheckBoxHoverColor" Color="#343434"/>
        <SolidColorBrush x:Key="AccentColor" Color="#FFD700"/>
        <SolidColorBrush x:Key="SecondaryButtonBg" Color="#393939"/>
        <SolidColorBrush x:Key="SecondaryButtonHover" Color="#2a2a2a"/>
        <SolidColorBrush x:Key="SecondaryButtonPressed" Color="#1e1e1e"/>
        <SolidColorBrush x:Key="TitlebarButtonHover" Color="#2d2d2d"/>
        <SolidColorBrush x:Key="TitlebarButtonPressed" Color="#292929"/>

        <!-- CheckBox Style -->
        <Style x:Key="DarkCheckBoxStyle" TargetType="CheckBox">
            <Setter Property="Foreground" Value="{StaticResource FgColor}"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <Border x:Name="Border"
                                Background="{StaticResource CheckBoxBgColor}"
                                BorderBrush="{StaticResource CheckBoxBorderColor}"
                                BorderThickness="1"
                                CornerRadius="4"
                                Padding="12,8">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="{StaticResource CheckBoxHoverColor}"/>
                            </Trigger>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="Border" Property="BorderBrush" Value="{StaticResource AccentColor}"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Button Style -->
        <Style x:Key="DarkButtonStyle" TargetType="Button">
            <Setter Property="Foreground" Value="{StaticResource FgColor}"/>
            <Setter Property="Background" Value="{StaticResource SecondaryButtonBg}"/>
            <Setter Property="BorderBrush" Value="{StaticResource ButtonBorderColor}"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="FontSize" Value="14"/>
            <Setter Property="FontWeight" Value="SemiBold"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Padding" Value="30,12"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="Border"
                                Background="{TemplateBinding Background}"
                                BorderBrush="{TemplateBinding BorderBrush}"
                                BorderThickness="{TemplateBinding BorderThickness}"
                                CornerRadius="6"
                                Padding="{TemplateBinding Padding}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="{StaticResource SecondaryButtonHover}"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="{StaticResource SecondaryButtonPressed}"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Title Bar Button Style -->
        <Style x:Key="TitleBarButtonStyle" TargetType="Button">
            <Setter Property="Width" Value="46"/>
            <Setter Property="Height" Value="30"/>
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Foreground" Value="{StaticResource FgColor}"/>
            <Setter Property="FontFamily" Value="Segoe MDL2 Assets"/>
            <Setter Property="FontSize" Value="10"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="Border" Background="{TemplateBinding Background}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="{StaticResource TitlebarButtonHover}"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="Border" Property="Background" Value="{StaticResource TitlebarButtonPressed}"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>
    </Window.Resources>

    <!-- Main Container -->
    <Border Background="{StaticResource BgColor}"
            BorderBrush="{StaticResource BorderColor}"
            BorderThickness="1"
            CornerRadius="8">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="30"/>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>

            <!-- Custom Title Bar -->
            <Border Grid.Row="0"
                    Background="{StaticResource CardBgColor}"
                    CornerRadius="8,8,0,0"
                    MouseLeftButtonDown="TitleBar_MouseLeftButtonDown">
                <Grid>
                    <TextBlock Text="Mario Antunes"
                               FontSize="12"
                               FontWeight="SemiBold"
                               VerticalAlignment="Center"
                               Margin="10,0,0,0"/>
                    <StackPanel Orientation="Horizontal" HorizontalAlignment="Right">
                        <Button x:Name="MinimizeButton" Content="&#xE921;" Style="{StaticResource TitleBarButtonStyle}"/>
                        <Button x:Name="MaxRestoreButton" Content="&#xE922;" Style="{StaticResource TitleBarButtonStyle}"/>
                        <Button x:Name="CloseButton" Content="&#xE8BB;" Style="{StaticResource TitleBarButtonStyle}">
                            <Button.Style>
                                <Style TargetType="Button" BasedOn="{StaticResource TitleBarButtonStyle}">
                                    <Style.Triggers>
                                        <Trigger Property="IsMouseOver" Value="True">
                                            <Setter Property="Background" Value="#C42B1C"/>
                                            <Setter Property="Foreground" Value="White"/>
                                        </Trigger>
                                    </Style.Triggers>
                                </Style>
                            </Button.Style>
                        </Button>
                    </StackPanel>
                </Grid>
            </Border>

            <!-- Content Area -->
            <Grid Grid.Row="1">
                <CheckBox x:Name="AvailableCheckBox"
                          Content="available?"
                          Style="{StaticResource DarkCheckBoxStyle}"
                          HorizontalAlignment="Center"
                          VerticalAlignment="Center"/>
            </Grid>

            <!-- Bottom Button Area -->
            <Border Grid.Row="2"
                    Background="{StaticResource CardBgColor}"
                    CornerRadius="0,0,8,8"
                    Padding="20">
                <Button x:Name="RunButton"
                        Content="run"
                        Style="{StaticResource DarkButtonStyle}"
                        HorizontalAlignment="Center"/>
            </Border>
        </Grid>
    </Border>
</Window>
"@

# Create window from XAML
$Window = [System.Windows.Markup.XamlReader]::Load(
    [System.Xml.XmlNodeReader]::new(([xml]$Xaml).DocumentElement)
)

# Get controls
$AvailableCheckBox = $Window.FindName("AvailableCheckBox")
$RunButton = $Window.FindName("RunButton")
$MinimizeButton = $Window.FindName("MinimizeButton")
$MaxRestoreButton = $Window.FindName("MaxRestoreButton")
$CloseButton = $Window.FindName("CloseButton")

# Event handlers
$TitleBar_MouseLeftButtonDown = {
    if ($_.ClickCount -eq 2) {
        & $MaxRestoreButton_Click
    } else {
        $Window.DragMove()
    }
}

$MinimizeButton_Click = {
    $Window.WindowState = [System.Windows.WindowState]::Minimized
}

$MaxRestoreButton_Click = {
    if ($Window.WindowState -eq [System.Windows.WindowState]::Maximized) {
        $Window.WindowState = [System.Windows.WindowState]::Normal
        $MaxRestoreButton.Content = [char]0xE922
    } else {
        $Window.WindowState = [System.Windows.WindowState]::Maximized
        $MaxRestoreButton.Content = [char]0xE923
    }
}

$CloseButton_Click = {
    $Window.Close()
}

$RunButton_Click = {
    $isAvailable = $AvailableCheckBox.IsChecked
    if ($isAvailable) {
        [System.Windows.MessageBox]::Show("Application is running! Available is checked.", "Mario Antunes", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)
    } else {
        [System.Windows.MessageBox]::Show("Application is running! Available is NOT checked.", "Mario Antunes", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
    }
}

# Attach event handlers
$TitleBarBorder = $Window.FindName("TitleBar_MouseLeftButtonDown") -as [System.Windows.FrameworkElement]
if ($TitleBarBorder) {
    $TitleBarBorder.AddHandler([System.Windows.UIElement]::MouseLeftButtonDownEvent, [System.Windows.Input.MouseButtonEventHandler]::new($TitleBar_MouseLeftButtonDown), $true)
}

$MinimizeButton.Add_Click($MinimizeButton_Click)
$MaxRestoreButton.Add_Click($MaxRestoreButton_Click)
$CloseButton.Add_Click($CloseButton_Click)
$RunButton.Add_Click($RunButton_Click)

# Show window
$Window.ShowDialog()
