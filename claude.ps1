Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Mario Antunes"
    Width="600"
    Height="400"
    ResizeMode="CanResize"
    SnapsToDevicePixels="True"
    WindowStartupLocation="CenterScreen"
    WindowStyle="None"
    AllowsTransparency="True"
    Background="Transparent"
    Foreground="{DynamicResource FgColor}">

    <Window.Resources>

        <!-- Custom CheckBox Style -->
        <Style x:Key="DarkCheckBox" TargetType="CheckBox">
            <Setter Property="Foreground" Value="{DynamicResource FgColor}" />
            <Setter Property="FontSize" Value="14" />
            <Setter Property="Cursor" Value="Hand" />
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="CheckBox">
                        <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                            <Border x:Name="CheckBorder"
                                    Width="18" Height="18"
                                    CornerRadius="4"
                                    Background="{DynamicResource CheckBoxBgColor}"
                                    BorderBrush="{DynamicResource CheckBoxBorderColor}"
                                    BorderThickness="1.5"
                                    SnapsToDevicePixels="True">
                                <Path x:Name="CheckMark"
                                      Data="M 2,7 L 6,11 L 14,3"
                                      Stroke="{DynamicResource AccentColor}"
                                      StrokeThickness="2"
                                      StrokeLineJoin="Round"
                                      StrokeStartLineCap="Round"
                                      StrokeEndLineCap="Round"
                                      Visibility="Collapsed"
                                      HorizontalAlignment="Center"
                                      VerticalAlignment="Center" />
                            </Border>
                            <ContentPresenter Margin="8,0,0,0" VerticalAlignment="Center" />
                        </StackPanel>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsChecked" Value="True">
                                <Setter TargetName="CheckMark" Property="Visibility" Value="Visible" />
                                <Setter TargetName="CheckBorder" Property="Background" Value="{DynamicResource CheckBoxBgColor}" />
                                <Setter TargetName="CheckBorder" Property="BorderBrush" Value="{DynamicResource AccentColor}" />
                            </Trigger>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="CheckBorder" Property="Background" Value="{DynamicResource CheckBoxHoverColor}" />
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <!-- Custom Button Style -->
        <Style x:Key="DarkButton" TargetType="Button">
            <Setter Property="Foreground" Value="#1a1a1a" />
            <Setter Property="FontSize" Value="13" />
            <Setter Property="FontWeight" Value="SemiBold" />
            <Setter Property="Cursor" Value="Hand" />
            <Setter Property="Width" Value="100" />
            <Setter Property="Height" Value="34" />
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="BtnBorder"
                                Background="{DynamicResource AccentColor}"
                                BorderBrush="{DynamicResource ButtonBorderColor}"
                                BorderThickness="1"
                                CornerRadius="6"
                                SnapsToDevicePixels="True">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center" />
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="BtnBorder" Property="Opacity" Value="0.85" />
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="BtnBorder" Property="Opacity" Value="0.7" />
                            </Trigger>
                            <Trigger Property="IsEnabled" Value="False">
                                <Setter TargetName="BtnBorder" Property="Background" Value="{DynamicResource ButtonDisabled}" />
                                <Setter Property="Foreground" Value="{DynamicResource ButtonTextDisabled}" />
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

    </Window.Resources>

    <!-- Outer border: rounded corners + drop shadow -->
    <Border CornerRadius="10"
            Background="{DynamicResource BgColor}"
            BorderBrush="{DynamicResource BorderColor}"
            BorderThickness="1">
        <Border.Effect>
            <DropShadowEffect Color="#000000" BlurRadius="20" ShadowDepth="4" Opacity="0.6" />
        </Border.Effect>

        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="36" />   <!-- Title bar -->
                <RowDefinition Height="*" />    <!-- Content -->
                <RowDefinition Height="60" />   <!-- Footer / buttons -->
            </Grid.RowDefinitions>

            <!-- ── Title bar ── -->
            <Border Grid.Row="0"
                    Background="{DynamicResource CardBgColor}"
                    CornerRadius="10,10,0,0"
                    MouseLeftButtonDown="TitleBar_MouseLeftButtonDown">
                <Grid>
                    <TextBlock Text="Mario Antunes"
                               Foreground="{DynamicResource FgColor}"
                               FontSize="13"
                               FontWeight="SemiBold"
                               VerticalAlignment="Center"
                               Margin="14,0,0,0" />

                    <!-- Window controls -->
                    <StackPanel Orientation="Horizontal"
                                HorizontalAlignment="Right"
                                VerticalAlignment="Center"
                                Margin="0,0,8,0">

                        <!-- Minimise -->
                        <Button x:Name="BtnMinimise"
                                Width="28" Height="28"
                                ToolTip="Minimise"
                                Cursor="Hand"
                                Background="Transparent"
                                BorderThickness="0">
                            <Button.Template>
                                <ControlTemplate TargetType="Button">
                                    <Border x:Name="MinBorder"
                                            Background="Transparent"
                                            CornerRadius="4"
                                            Width="28" Height="28">
                                        <Path Data="M 6,14 L 22,14"
                                              Stroke="{DynamicResource AppIdColor}"
                                              StrokeThickness="1.5"
                                              StrokeStartLineCap="Round"
                                              StrokeEndLineCap="Round" />
                                    </Border>
                                    <ControlTemplate.Triggers>
                                        <Trigger Property="IsMouseOver" Value="True">
                                            <Setter TargetName="MinBorder" Property="Background" Value="{DynamicResource TitlebarButtonHover}" />
                                        </Trigger>
                                        <Trigger Property="IsPressed" Value="True">
                                            <Setter TargetName="MinBorder" Property="Background" Value="{DynamicResource TitlebarButtonPressed}" />
                                        </Trigger>
                                    </ControlTemplate.Triggers>
                                </ControlTemplate>
                            </Button.Template>
                        </Button>

                        <!-- Close -->
                        <Button x:Name="BtnClose"
                                Width="28" Height="28"
                                ToolTip="Close"
                                Cursor="Hand"
                                Background="Transparent"
                                BorderThickness="0">
                            <Button.Template>
                                <ControlTemplate TargetType="Button">
                                    <Border x:Name="CloseBorder"
                                            Background="Transparent"
                                            CornerRadius="4"
                                            Width="28" Height="28">
                                        <Path Data="M 8,8 L 20,20 M 20,8 L 8,20"
                                              Stroke="{DynamicResource AppIdColor}"
                                              StrokeThickness="1.5"
                                              StrokeStartLineCap="Round"
                                              StrokeEndLineCap="Round" />
                                    </Border>
                                    <ControlTemplate.Triggers>
                                        <Trigger Property="IsMouseOver" Value="True">
                                            <Setter TargetName="CloseBorder" Property="Background" Value="#C0392B" />
                                        </Trigger>
                                        <Trigger Property="IsPressed" Value="True">
                                            <Setter TargetName="CloseBorder" Property="Background" Value="#962d22" />
                                        </Trigger>
                                    </ControlTemplate.Triggers>
                                </ControlTemplate>
                            </Button.Template>
                        </Button>

                    </StackPanel>
                </Grid>
            </Border>

            <!-- ── Content ── -->
            <Grid Grid.Row="1">
                <!-- Checkbox centred -->
                <CheckBox x:Name="ChkAvailable"
                          Content="available?"
                          Style="{StaticResource DarkCheckBox}"
                          HorizontalAlignment="Center"
                          VerticalAlignment="Center" />
            </Grid>

            <!-- ── Footer ── -->
            <Border Grid.Row="2"
                    Background="{DynamicResource CardBgColor}"
                    CornerRadius="0,0,10,10"
                    BorderBrush="{DynamicResource BorderColor}"
                    BorderThickness="0,1,0,0">
                <Button x:Name="BtnRun"
                        Content="run"
                        Style="{StaticResource DarkButton}"
                        HorizontalAlignment="Center"
                        VerticalAlignment="Center" />
            </Border>

        </Grid>
    </Border>
</Window>
"@

# ── Load the XAML ──────────────────────────────────────────────────────────────
$reader = [System.Xml.XmlNodeReader]::new($xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)

# ── Inject colour resources ────────────────────────────────────────────────────
$colors = @{
    BgColor                    = "#202020"
    FgColor                    = "#FFFFFF"
    CardBgColor                = "#2b2b2b"
    BorderColor                = "#404040"
    ButtonBorderColor          = "#404040"
    CheckBoxBgColor            = "#272727"
    CheckBoxBorderColor        = "#808080"
    CheckBoxHoverColor         = "#343434"
    AccentColor                = "#FFD700"
    ButtonDisabled             = "#434343"
    ButtonTextDisabled         = "#989898"
    TitlebarButtonHover        = "#2d2d2d"
    TitlebarButtonPressed      = "#292929"
    AppIdColor                 = "#afafaf"
}

foreach ($key in $colors.Keys) {
    $brush = [System.Windows.Media.SolidColorBrush]::new(
        [System.Windows.Media.ColorConverter]::ConvertFromString($colors[$key])
    )
    $window.Resources.Add($key, $brush)
}

# ── Named element references ───────────────────────────────────────────────────
$btnClose    = $window.FindName("BtnClose")
$btnMinimise = $window.FindName("BtnMinimise")
$btnRun      = $window.FindName("BtnRun")
$chkAvail    = $window.FindName("ChkAvailable")

# ── Event handlers ─────────────────────────────────────────────────────────────
$btnClose.Add_Click({ $window.Close() })
$btnMinimise.Add_Click({ $window.WindowState = [System.Windows.WindowState]::Minimized })

# Drag the window by the title bar
$window.Add_MouseLeftButtonDown({
    param($sender, $e)
    if ($e.Source.GetType().Name -eq "Border" -or
        $e.Source.GetType().Name -eq "TextBlock") {
        $window.DragMove()
    }
})

# Title bar drag helper referenced in XAML event
$window | Add-Member -MemberType ScriptMethod -Name TitleBar_MouseLeftButtonDown -Value {
    param($sender, $e)
    $window.DragMove()
} -Force

$btnRun.Add_Click({
    $isAvailable = $chkAvail.IsChecked
    [System.Windows.MessageBox]::Show(
        "Available: $isAvailable",
        "Mario Antunes",
        [System.Windows.MessageBoxButton]::OK,
        [System.Windows.MessageBoxImage]::Information
    )
})

# ── Show ───────────────────────────────────────────────────────────────────────
$window.ShowDialog() | Out-Null