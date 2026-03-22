# Load required WPF assemblies
Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

# Define XAML with window layout, resources, and styles
$xaml = @'
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:shell="clr-namespace:System.Windows.Shell;assembly=PresentationFramework"
        Title="Mario Antunes"
        Width="600" Height="400"
        WindowStyle="None"
        AllowsTransparency="True"
        Background="Transparent"
        ResizeMode="CanResize"
        SnapsToDevicePixels="True"
        WindowStartupLocation="CenterScreen">
    <Window.Resources>
        <!-- Color definitions -->
        <SolidColorBrush x:Key="BgColor" Color="#202020"/>
        <SolidColorBrush x:Key="FgColor" Color="#FFFFFF"/>
        <SolidColorBrush x:Key="CardBgColor" Color="#2b2b2b"/>
        <SolidColorBrush x:Key="BorderColor" Color="#404040"/>
        <SolidColorBrush x:Key="ButtonBorderColor" Color="#404040"/>
        <SolidColorBrush x:Key="CheckBoxBgColor" Color="#272727"/>
        <SolidColorBrush x:Key="CheckBoxBorderColor" Color="#808080"/>
        <SolidColorBrush x:Key="CheckBoxHoverColor" Color="#343434"/>
        <SolidColorBrush x:Key="ComboBgColor" Color="#373737"/>
        <SolidColorBrush x:Key="ComboHoverColor" Color="#434343"/>
        <SolidColorBrush x:Key="ComboItemBgColor" Color="#2c2c2c"/>
        <SolidColorBrush x:Key="ComboItemHoverColor" Color="#383838"/>
        <SolidColorBrush x:Key="ComboItemSelectedColor" Color="#343434"/>
        <SolidColorBrush x:Key="AccentColor" Color="#FFD700"/>
        <SolidColorBrush x:Key="ButtonDisabled" Color="#434343"/>
        <SolidColorBrush x:Key="ButtonTextDisabled" Color="#989898"/>
        <SolidColorBrush x:Key="SecondaryButtonBg" Color="#393939"/>
        <SolidColorBrush x:Key="SecondaryButtonHover" Color="#2a2a2a"/>
        <SolidColorBrush x:Key="SecondaryButtonPressed" Color="#1e1e1e"/>
        <SolidColorBrush x:Key="SecondaryButtonDisabled" Color="#3b3b3b"/>
        <SolidColorBrush x:Key="SecondaryButtonTextDisabled" Color="#787878"/>
        <SolidColorBrush x:Key="InputFocusColor" Color="#1f1f1f"/>
        <SolidColorBrush x:Key="ScrollBarThumbColor" Color="#3d3d3d"/>
        <SolidColorBrush x:Key="ScrollBarThumbHoverColor" Color="#4b4b4b"/>
        <SolidColorBrush x:Key="TitlebarButtonHover" Color="#2d2d2d"/>
        <SolidColorBrush x:Key="TitlebarButtonPressed" Color="#292929"/>
        <SolidColorBrush x:Key="AppIdColor" Color="#afafaf"/>
        <SolidColorBrush x:Key="SearchHighlightColor" Color="#4A4A2A"/>
        <SolidColorBrush x:Key="SearchHighlightActiveColor" Color="#8A7000"/>
        <SolidColorBrush x:Key="TableHeaderColor" Color="#333333"/>

        <!-- Style for title bar buttons -->
        <Style x:Key="TitleBarButton" TargetType="Button">
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Foreground" Value="{DynamicResource FgColor}"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor" Value="Hand"/>
            <Style.Triggers>
                <Trigger Property="IsMouseOver" Value="True">
                    <Setter Property="Background" Value="{DynamicResource TitlebarButtonHover}"/>
                </Trigger>
                <Trigger Property="IsPressed" Value="True">
                    <Setter Property="Background" Value="{DynamicResource TitlebarButtonPressed}"/>
                </Trigger>
            </Style.Triggers>
        </Style>
    </Window.Resources>

    <!-- Use WindowChrome to keep system resize/move while having a custom title bar -->
    <shell:WindowChrome.WindowChrome>
        <shell:WindowChrome GlassFrameThickness="0"
                           CaptionHeight="30"
                           ResizeBorderThickness="5"
                           CornerRadius="0"/>
    </shell:WindowChrome.WindowChrome>

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Custom title bar -->
        <Grid Grid.Row="0" Height="30"
              shell:WindowChrome.IsHitTestVisibleInChrome="True">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="Auto"/>
                <ColumnDefinition Width="Auto"/>
            </Grid.ColumnDefinitions>
            <TextBlock Grid.Column="0"
                       Text="Mario Antunes"
                       VerticalAlignment="Center"
                       Margin="10,0,0,0"
                       Foreground="{DynamicResource FgColor}"
                       FontSize="14"/>
            <Button x:Name="MinimizeButton"
                    Grid.Column="1"
                    Style="{StaticResource TitleBarButton}"
                    Content="─"
                    Width="30" Height="30"
                    FontSize="16"
                    FontWeight="Bold"
                    shell:WindowChrome.IsHitTestVisibleInChrome="False"/>
            <Button x:Name="CloseButton"
                    Grid.Column="2"
                    Style="{StaticResource TitleBarButton}"
                    Content="✕"
                    Width="30" Height="30"
                    FontSize="12"
                    shell:WindowChrome.IsHitTestVisibleInChrome="False"/>
        </Grid>

        <!-- Main content area -->
        <Grid Grid.Row="1" Background="{DynamicResource BgColor}">
            <Grid.RowDefinitions>
                <RowDefinition Height="*"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>

            <!-- Centered checkbox -->
            <StackPanel Grid.Row="0"
                        VerticalAlignment="Center"
                        HorizontalAlignment="Center">
                <CheckBox x:Name="AvailableCheckBox"
                          Content="available?"
                          Foreground="{DynamicResource FgColor}"
                          Margin="10"/>
            </StackPanel>

            <!-- Bottom‑centered button -->
            <Button x:Name="RunButton"
                    Grid.Row="1"
                    Content="run"
                    Width="100"
                    Height="30"
                    Margin="0,0,0,20"
                    HorizontalAlignment="Center"
                    Background="{DynamicResource CardBgColor}"
                    Foreground="{DynamicResource FgColor}"
                    BorderBrush="{DynamicResource ButtonBorderColor}"
                    BorderThickness="1"
                    Cursor="Hand"/>
        </Grid>
    </Grid>
</Window>
'@

# Load the XAML
$reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]$xaml)
$window = [System.Windows.Markup.XamlReader]::Load($reader)

# Get references to the controls
$runButton = $window.FindName("RunButton")
$availableCheckBox = $window.FindName("AvailableCheckBox")
$minimizeButton = $window.FindName("MinimizeButton")
$closeButton = $window.FindName("CloseButton")

# Define event handlers
$runButton.Add_Click({
    $status = if ($availableCheckBox.IsChecked) { "available" } else { "not available" }
    [System.Windows.MessageBox]::Show("Run clicked. The user is $status.", "Info")
})

$minimizeButton.Add_Click({ $window.WindowState = 'Minimized' })
$closeButton.Add_Click({ $window.Close() })

# Allow the window to be moved by clicking on the title bar area.
# This is already covered by WindowChrome.CaptionHeight and the
# IsHitTestVisibleInChrome="True" on the title bar Grid.

# Show the window
$window.ShowDialog() | Out-Null