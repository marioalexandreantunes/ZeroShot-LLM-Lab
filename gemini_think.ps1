Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

# 1. Definição do XAML
# Usamos DynamicResource para que os elementos herdem as cores que injetaremos via script
$inputXML = @"
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
    
    <Border Background="{DynamicResource BgColor}" 
            CornerRadius="10" 
            BorderBrush="{DynamicResource BorderColor}" 
            BorderThickness="1">
        <Grid>
            <TextBlock Text="Mario Antunes" 
                       HorizontalAlignment="Left" VerticalAlignment="Top" 
                       Margin="15,10,0,0" 
                       FontSize="12" Foreground="{DynamicResource AppIdColor}" Opacity="0.8"/>
            
            <StackPanel VerticalAlignment="Center" HorizontalAlignment="Center">
                <CheckBox Name="chkAvailable" 
                          Content="available?" 
                          FontSize="16" 
                          Foreground="{DynamicResource FgColor}"
                          Cursor="Hand"/>
            </StackPanel>

            <Button Name="btnRun" 
                    Content="run" 
                    Width="100" Height="35" 
                    VerticalAlignment="Bottom" 
                    HorizontalAlignment="Center" 
                    Margin="0,0,0,30"
                    Background="{DynamicResource SecondaryButtonBg}"
                    Foreground="{DynamicResource FgColor}"
                    BorderBrush="{DynamicResource ButtonBorderColor}">
                <Button.Resources>
                    <Style TargetType="Border">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>

            <Button Name="btnClose" Content="✕" 
                    VerticalAlignment="Top" HorizontalAlignment="Right" 
                    Width="30" Height="30" Background="Transparent" 
                    Foreground="{DynamicResource FgColor}" BorderThickness="0"
                    Margin="0,5,5,0"/>
        </Grid>
    </Border>
</Window>
"@

# 2. Criar a janela a partir do XAML
$reader = [XML.XmlReader]::Create([System.IO.StringReader]::New($inputXML))
$window = [Windows.Markup.XamlReader]::Load($reader)

# 3. Injetar sua palete de cores nos Recursos da Janela
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

# 4. Referenciar os Elementos para Lógica
$btnRun = $window.FindName("btnRun")
$btnClose = $window.FindName("btnClose")
$chkAvailable = $window.FindName("chkAvailable")

# Ação do Botão Run
$btnRun.Add_Click({
    if ($chkAvailable.IsChecked) {
        [System.Windows.MessageBox]::Show("Status: Available! Running task...", "Mario Antunes UI")
    } else {
        [System.Windows.MessageBox]::Show("Please check 'available' first.", "Alert")
    }
})

# Fechar Janela
$btnClose.Add_Click({ $window.Close() })

# Permitir arrastar a janela (Essencial para WindowStyle="None")
$window.Add_MouseLeftButtonDown({
    $window.DragMove()
})

# 5. Exibir a Janela
$window.ShowDialog() | Out-Null