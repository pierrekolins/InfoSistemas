object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'InfoSistemas 1.0'
  ClientHeight = 207
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object t: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 207
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 158
      Top = 62
      Width = 137
      Height = 23
      Caption = 'Seja Bem-vindo!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnNovoCliente: TButton
      Left = 40
      Top = 144
      Width = 385
      Height = 25
      Caption = 'Iniciar'
      TabOrder = 0
      OnClick = btnNovoClienteClick
    end
  end
end
