# Teste Simples de LLMs 

## 🇵🇹 Versão em Português (PT-PT)

Um teste simples realizado em várias plataformas de forma gratuita. Utilizei apenas um *prompt* básico para avaliar a qualidade do código gerado!

## Modelos Utilizados

Foram utilizados os chats padrão dos seguintes modelos:
* Qwen 3.5-Plus
* Claude Sonnet 4.6
* Gemini 3 Fast / Thinking
* Grok 4.2 Auto
* GLM 5.0
* MiniMax 2.7
* DeepSeek 3.2

## Prompt usado

queria algo que uma pessoa normal pediria:
```batch
I want to build a UI. The UI is created in pure PowerShell, using Windows Presentation Framework (WPF)/Windows Forms generated dynamically from the script.
A simple dark mode window, 600x400, titled "Mario Antunes", with:
ResizeMode="CanResize"
SnapsToDevicePixels="True"
WindowStartupLocation="CenterScreen"
WindowStyle="None"
AllowsTransparency="True"
Background="Transparent"
Foreground="{DynamicResource FgColor}"
Add a centered checkbox with the text "available?", and a button with the text "run" at the bottom, centered.
The MainWindow.xaml file defines practically the entire main UI of the application in XAML, using WPF (window layout, styles, tabs, buttons, lists, etc.), 
which is then loaded/controlled by the PowerShell script.
Color palette I like to use:
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
```

## Considerações e Notas

* **Qwen:** A UI abre, mas apenas se vê a *checkbox*. A janela aparece no centro, mas não é possível fechá-la nem arrastá-la.
* **Claude:** O código gerado apresentou erros e não executou.
* **Gemini Fast:** Abre com tudo o que foi pedido. É possível arrastar a janela e o botão de fechar funciona. A geração do código foi extremamente rápida!
* **Gemini Think:** Abre com todos os requisitos, incluindo o título no local correto e um símbolo "X" para fechar. O botão inferior funciona como esperado. Embora mais lento que a versão Fast, continua a ser muito rápido.
* **Grok:** Abre com um erro. Não apresenta título nem botão de fechar; foi necessário forçar a paragem do script.
* **GLM:** Demorou muito tempo a processar. O código executa e permite arrastar, mas não tem título nem botões de saída visíveis. A *checkbox* e o botão principal aparecem.
* **MiniMax:** Criou um projeto .NET completo para ser compilado. Embora tenha fornecido um ficheiro `.ps1`, este apresentou erros.
* **DeepSeek:** Tempo de processamento elevado. A UI iniciou sem título visível (devido à transparência) e sem forma de arrastar ou fechar a janela.

## Resultados Finais

1.  **Gemini 3 Thinking** [8/10]
2.  **Gemini 3 Fast** [6/10]
3.  **GLM 5.0** [4/10]
4.  **Grok 4.2 Auto** [4/10]
5.  **DeepSeek 3.2** [4/10]
6.  **Qwen 3.5-Plus** [3/10]
7.  **Claude Sonnet 4.6** [1/10]
8.  **MiniMax 2.7** [1/10]

**Conclusão:** O Gemini 3 Thinking apresentou o código mais limpo, sem erros e com todos os requisitos cumpridos. Num ambiente de "Agente", o Claude ou o MiniMax poderiam ter tido melhores resultados ao tentar corrigir os próprios erros, mas este teste focou-se apenas na capacidade de gerar código funcional à primeira tentativa (zero-shot).

---

## 🇺🇸 English Version

# Simple LLM Benchmark

A straightforward test across multiple free platforms using a single prompt to evaluate the generated code quality.

## Models Tested

Standard chat versions were used:
* Qwen 3.5-Plus
* Claude Sonnet 4.6
* Gemini 3 Fast / Thinking
* Grok 4.2 Auto
* GLM 5.0
* MiniMax 2.7
* DeepSeek 3.2

## Prompt used

I wanted something a normal person would ask for:
```batch
I want to build a UI. The UI is created in pure PowerShell, using Windows Presentation Framework (WPF)/Windows Forms generated dynamically from the script.
A simple dark mode window, 600x400, titled "Mario Antunes", with:
ResizeMode="CanResize"
SnapsToDevicePixels="True"
WindowStartupLocation="CenterScreen"
WindowStyle="None"
AllowsTransparency="True"
Background="Transparent"
Foreground="{DynamicResource FgColor}"
Add a centered checkbox with the text "available?", and a button with the text "run" at the bottom, centered.
The MainWindow.xaml file defines practically the entire main UI of the application in XAML, using WPF (window layout, styles, tabs, buttons, lists, etc.), 
which is then loaded/controlled by the PowerShell script.
Color palette I like to use:
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
```

## Key Observations

* **Qwen:** The UI opens, but only the checkbox is visible. It appears centered but cannot be closed or dragged.
* **Claude:** Code failed with errors.
* **Gemini Fast:** Opens with everything requested. It supports dragging and closes correctly via the button. Extremely fast generation!
* **Gemini Think:** Meets all requirements, including a correctly placed title and a working "X" close button. Bottom button works as expected. Slower than Fast, but still very quick.
* **Grok:** Opens with an error. No title or close button; required a forced script termination.
* **GLM:** Long thinking time. Code runs and is draggable, but lacks a title or exit button. The main checkbox and button are present.
* **MiniMax:** Created a full .NET project for compilation. While it provided a `.ps1` file, it was riddled with errors.
* **DeepSeek:** Very slow processing. The UI launched with no visible title (due to transparency) and no way to drag or close the window.

## Final Scores

1.  **Gemini 3 Thinking** [8/10]
2.  **Gemini 3 Fast** [6/10]
3.  **GLM 5.0** [4/10]
4.  **Grok 4.2 Auto** [4/10]
5.  **DeepSeek 3.2** [4/10]
6.  **Qwen 3.5-Plus** [3/10]
7.  **Claude Sonnet 4.6** [1/10]
8.  **MiniMax 2.7** [1/10]

**Conclusion:** Gemini 3 Thinking delivered the cleanest code without errors, fulfilling the entire prompt. In an "Agentic" workflow, Claude or MiniMax might have performed better by self-correcting, but this test aimed to see if the initial code was "ready to use" for a developer.
