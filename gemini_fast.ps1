Add-Type -AssemblyName PresentationFramework, PresentationCore, WindowsBase

# 1. Definição do XAML
$xaml = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Mario Antunes" Height="400" Width="600"
        ResizeMode="CanResize" SnapsToDevicePixels="True"
        WindowStartupLocation="CenterScreen" WindowStyle="None"
        AllowsTransparency="True" Background="Transparent"
        Foreground="{DynamicResource FgColor}">
    
    <Border Background="{DynamicResource BgColor}" CornerRadius="10" BorderBrush="{DynamicResource BorderColor}" BorderThickness="1">
        <Grid>
            <Grid.RowDefinitions>
                <RowDefinition Height="40"/> <RowDefinition Height="*"/>    <RowDefinition Height="60"/>   </Grid.RowDefinitions>

            <TextBlock Text="Mario Antunes" Grid.Row="0" VerticalAlignment="Center" HorizontalAlignment="Center" 
                       FontWeight="Bold" Foreground="{DynamicResource AccentColor}"/>

            <StackPanel Grid.Row="1" VerticalAlignment="Center" HorizontalAlignment="Center">
                <CheckBox Name="chkAvailable" Content="available?" 
                          Foreground="{DynamicResource FgColor}" 
                          FontSize="16" Cursor="Hand"/>
            </StackPanel>

            <Button Name="btnRun" Grid.Row="2" Content="Run" 
                    Width="100" Height="35" Margin="0,0,0,10"
                    Background="{DynamicResource SecondaryButtonBg}" 
                    Foreground="{DynamicResource FgColor}"
                    BorderBrush="{DynamicResource ButtonBorderColor}"
                    Cursor="Hand">
                <Button.Resources>
                    <Style TargetType="Border">
                        <Setter Property="CornerRadius" Value="5"/>
                    </Style>
                </Button.Resources>
            </Button>
        </Grid>
    </Border>
</Window>
"@

# 2. Criar a Janela
$reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($xaml))
$window = [System.Windows.Markup.XamlReader]::Load($reader)

# 3. Aplicar a tua Palete de Cores
$window.Resources.Add("BgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#202020")))
$window.Resources.Add("FgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFFFFF")))
$window.Resources.Add("CardBgColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#2b2b2b")))
$window.Resources.Add("BorderColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#404040")))
$window.Resources.Add("ButtonBorderColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#404040")))
$window.Resources.Add("AccentColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFD700")))
$window.Resources.Add("SecondaryButtonBg", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#393939")))

# 4. Lógica de Interação
$btnRun = $window.FindName("btnRun")
$chkAvailable = $window.FindName("chkAvailable")

# Evento para fechar a janela (opcional, já que não tem X)
$window.Add_MouseDown({
    if ($_.ChangedButton -eq "Left") { $this.DragMove() }
})

$btnRun.Add_Click({
    $status = if($chkAvailable.IsChecked) { "disponível" } else { "indisponível" }
    [System.Windows.MessageBox]::Show("A executar... Status: $status", "Info")
    $window.Close()
})

# 5. Exibir
$window.ShowDialog() | Out-Null