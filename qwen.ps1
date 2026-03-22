#Requires -Version 5.1
using namespace System.Windows
using namespace System.Windows.Controls
using namespace System.Windows.Media

# Carregar Assemblies WPF
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

function Invoke-MarioUi {
    try {
        # Criar Janela
        $window = [Window]::new()
        $window.Title = "Mario Antunes"
        $window.Width = 600
        $window.Height = 400
        $window.ResizeMode = [ResizeMode]::CanResize
        $window.SnapsToDevicePixels = $true
        $window.WindowStartupLocation = [WindowStartupLocation]::CenterScreen
        $window.WindowStyle = [WindowStyle]::None
        $window.AllowsTransparency = $true
        $window.Background = [Brushes]::Transparent
        
        # Definir Palete de Cores
        $colors = @{
            "BgColor" = "#202020"; "FgColor" = "#FFFFFF"; "CardBgColor" = "#2b2b2b"
            "BorderColor" = "#404040"; "ButtonBorderColor" = "#404040"; "CheckBoxBgColor" = "#272727"
            "CheckBoxBorderColor" = "#808080"; "CheckBoxHoverColor" = "#343434"; "ComboBgColor" = "#373737"
            "ComboHoverColor" = "#434343"; "ComboItemBgColor" = "#2c2c2c"; "ComboItemHoverColor" = "#383838"
            "ComboItemSelectedColor" = "#343434"; "AccentColor" = "#FFD700"; "ButtonDisabled" = "#434343"
            "ButtonTextDisabled" = "#989898"; "SecondaryButtonBg" = "#393939"; "SecondaryButtonHover" = "#2a2a2a"
            "SecondaryButtonPressed" = "#1e1e1e"; "SecondaryButtonDisabled" = "#3b3b3b"; "SecondaryButtonTextDisabled" = "#787878"
            "InputFocusColor" = "#1f1f1f"; "ScrollBarThumbColor" = "#3d3d3d"; "ScrollBarThumbHoverColor" = "#4b4b4b"
            "TitlebarButtonHover" = "#2d2d2d"; "TitlebarButtonPressed" = "#292929"; "AppIdColor" = "#afafaf"
            "SearchHighlightColor" = "#4A4A2A"; "SearchHighlightActiveColor" = "#8A7000"; "TableHeaderColor" = "#333333"
        }

        foreach ($kvp in $colors.GetEnumerator()) {
            $brush = [SolidColorBrush]::new([ColorConverter]::ConvertFromString($kvp.Value))
            $window.Resources.Add($kvp.Key, $brush)
        }

        $window.Foreground = $window.Resources["FgColor"]

        # Layout Principal (Grid)
        $grid = [Grid]::new()
        $grid.Background = $window.Resources["BgColor"]
        $grid.Margin = [Thickness]::new(10)
        
        # Definição de Linhas (Centro e Bottom)
        $rowMain = [RowDefinition]::new()
        $rowMain.Height = [GridLength]::new(1, [GridUnitType]::Star)
        $rowBottom = [RowDefinition]::new()
        $rowBottom.Height = [GridLength]::new([GridUnitType]::Auto)
        $grid.RowDefinitions.Add($rowMain)
        $grid.RowDefinitions.Add($rowBottom)

        # Checkbox (Centro)
        $checkBox = [CheckBox]::new()
        $checkBox.Content = "available?"
        $checkBox.HorizontalAlignment = [HorizontalAlignment]::Center
        $checkBox.VerticalAlignment = [VerticalAlignment]::Center
        $checkBox.Foreground = $window.Resources["FgColor"]
        [Grid]::SetRow($checkBox, 0)

        # Botão (Bottom)
        $button = [Button]::new()
        $button.Content = "run"
        $button.Width = 100
        $button.Height = 30
        $button.HorizontalAlignment = [HorizontalAlignment]::Center
        $button.VerticalAlignment = [VerticalAlignment]::Center
        $button.Margin = [Thickness]::new(0, 0, 0, 10)
        $button.Background = $window.Resources["AccentColor"]
        $button.Foreground = $window.Resources["BgColor"]
        $button.BorderThickness = [Thickness]::new(0)
        [Grid]::SetRow($button, 1)

        # Eventos
        $button.Add_Click({
            Write-Host "Run clicked - Checkbox: $($checkBox.IsChecked)" -ForegroundColor Gold
        })

        # Montar UI
        $grid.Children.Add($checkBox)
        $grid.Children.Add($button)
        $window.Content = $grid

        # Mostrar
        $window.ShowDialog()
    }
    catch {
        Write-Error "Falha ao criar UI: $_"
    }
}

Invoke-MarioUi