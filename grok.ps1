Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

# Cria a janela principal
$window = New-Object System.Windows.Window
$window.Title = "Mario Antunes"
$window.Width = 600
$window.Height = 400
$window.ResizeMode = "CanResize"
$window.SnapsToDevicePixels = $true
$window.WindowStartupLocation = "CenterScreen"
$window.WindowStyle = "None"
$window.AllowsTransparency = $true
$window.Background = "Transparent"
$window.Foreground = [System.Windows.Media.Brushes]::White

# ────────────────────────────────────────────────
# Adiciona as cores como recursos (paleta que indicaste)
$window.Resources = New-Object System.Windows.ResourceDictionary

$window.Resources.Add("BgColor",           [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#202020")))
$window.Resources.Add("FgColor",           [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFFFFF")))
$window.Resources.Add("CardBgColor",       [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#2b2b2b")))
$window.Resources.Add("BorderColor",       [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#404040")))
$window.Resources.Add("AccentColor",       [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#FFD700")))
$window.Resources.Add("CheckBoxBgColor",   [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#272727")))
$window.Resources.Add("CheckBoxBorderColor",[System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#808080")))
$window.Resources.Add("CheckBoxHoverColor", [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#343434")))
$window.Resources.Add("ButtonDisabled",    [System.Windows.Media.SolidColorBrush]::new([System.Windows.Media.ColorConverter]::ConvertFromString("#434343")))

# ────────────────────────────────────────────────
# Template da janela (borda arredondada + fundo dark)
$border = New-Object System.Windows.Controls.Border
$border.Background = $window.Resources["BgColor"]
$border.BorderBrush = $window.Resources["BorderColor"]
$border.BorderThickness = "1"
$border.CornerRadius = "8"
$border.Padding = "16"
$border.Child = $null   # será preenchido depois

$window.Content = $border

# ────────────────────────────────────────────────
# Grid principal (3 linhas: espaço topo + conteúdo central + botão em baixo)
$grid = New-Object System.Windows.Controls.Grid
$grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="1*"}))
$grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="Auto"}))
$grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="Auto"}))
$grid.RowDefinitions.Add((New-Object System.Windows.Controls.RowDefinition -Property @{Height="24"}))  # margem inferior

$border.Child = $grid

# ────────────────────────────────────────────────
# CheckBox centralizado
$chk = New-Object System.Windows.Controls.CheckBox
$chk.Content = "available?"
$chk.FontSize = 18
$chk.Foreground = $window.Resources["FgColor"]
$chk.Background = $window.Resources["CheckBoxBgColor"]
$chk.BorderBrush = $window.Resources["CheckBoxBorderColor"]
$chk.HorizontalAlignment = "Center"
$chk.VerticalAlignment = "Center"
$chk.Margin = "0,0,0,20"

# Estilo mais "dark" no checkbox (opcional – melhora visual)
$chk.Style = New-Object System.Windows.Style([System.Windows.Controls.CheckBox])
$chk.Style.Setters.Add((New-Object System.Windows.Setter -Property @{Property=[System.Windows.Controls.CheckBox]::BackgroundProperty; Value=$window.Resources["CheckBoxBgColor"]}))
$chk.Style.Setters.Add((New-Object System.Windows.Setter -Property @{Property=[System.Windows.Controls.CheckBox]::BorderBrushProperty; Value=$window.Resources["CheckBoxBorderColor"]}))

[void]$grid.Children.Add($chk)
[System.Windows.Controls.Grid]::SetRow($chk, 1)

# ────────────────────────────────────────────────
# Botão "Run" na parte inferior
$btnRun = New-Object System.Windows.Controls.Button
$btnRun.Content = "Run"
$btnRun.FontSize = 16
$btnRun.Padding = "32,12"
$btnRun.Margin = "0,0,0,20"
$btnRun.HorizontalAlignment = "Center"
$btnRun.MinWidth = 140

# Cores do botão (usando AccentColor como destaque)
$btnRun.Background = $window.Resources["AccentColor"]
$btnRun.Foreground = [System.Windows.Media.Brushes]::Black
$btnRun.BorderThickness = 0
$btnRun.FontWeight = "SemiBold"
$btnRun.Cursor = "Hand"

# Hover / Pressed simples (opcional)
$btnRun.Add_MouseEnter({
    $this.Background = [System.Windows.Media.Brushes]::Gold
})
$btnRun.Add_MouseLeave({
    $this.Background = $window.Resources["AccentColor"]
})
$btnRun.Add_PreviewMouseLeftButtonDown({
    $this.Background = [System.Windows.Media.Brushes]::DarkGoldenrod
})

[void]$grid.Children.Add($btnRun)
[System.Windows.Controls.Grid]::SetRow($btnRun, 2)

# ────────────────────────────────────────────────
# Evento de clique no botão (exemplo)
$btnRun.Add_Click({
    $state = if ($chk.IsChecked) { "ON" } else { "OFF" }
    [System.Windows.MessageBox]::Show("Run clicked! Checkbox = $state", "Info")
})

# ────────────────────────────────────────────────
# Permitir arrastar a janela (já que WindowStyle=None)
$window.Add_MouseLeftButtonDown({
    if ($_.ButtonState -eq "Pressed") {
        $window.DragMove()
    }
})

# Mostrar a janela
[void]$window.ShowDialog()