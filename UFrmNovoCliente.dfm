object FrmNovoCliente: TFrmNovoCliente
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Novo Cliente'
  ClientHeight = 447
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 798
    Height = 447
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 16
      Width = 66
      Height = 13
      Caption = 'Dados Cliente'
    end
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 272
      Top = 80
      Width = 19
      Height = 13
      Caption = 'CPF'
    end
    object Label4: TLabel
      Left = 32
      Top = 80
      Width = 52
      Height = 13
      Caption = 'Identidade'
    end
    object Label5: TLabel
      Left = 32
      Top = 115
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label6: TLabel
      Left = 32
      Top = 146
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object GroupBox1: TGroupBox
      Left = 32
      Top = 184
      Width = 545
      Height = 193
      Caption = 'Endere'#231'o:'
      TabOrder = 5
      object Label7: TLabel
        Left = 21
        Top = 28
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label8: TLabel
        Left = 21
        Top = 60
        Width = 51
        Height = 13
        Caption = 'Logadouro'
      end
      object Label9: TLabel
        Left = 295
        Top = 60
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label10: TLabel
        Left = 21
        Top = 93
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label11: TLabel
        Left = 21
        Top = 129
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label12: TLabel
        Left = 269
        Top = 93
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label13: TLabel
        Left = 21
        Top = 161
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label14: TLabel
        Left = 269
        Top = 162
        Width = 19
        Height = 13
        Caption = 'Pa'#237's'
      end
      object edtCEP: TEdit
        Left = 91
        Top = 20
        Width = 121
        Height = 21
        TabOrder = 0
        OnKeyPress = edtCEPKeyPress
      end
      object edtLogadouro: TEdit
        Left = 91
        Top = 57
        Width = 190
        Height = 21
        TabOrder = 2
      end
      object edtNumero: TEdit
        Left = 349
        Top = 57
        Width = 80
        Height = 21
        TabOrder = 3
      end
      object edtPais: TEdit
        Left = 308
        Top = 158
        Width = 121
        Height = 21
        TabOrder = 8
      end
      object edtEstado: TEdit
        Left = 91
        Top = 158
        Width = 121
        Height = 21
        TabOrder = 7
      end
      object edtCidade: TEdit
        Left = 308
        Top = 90
        Width = 121
        Height = 21
        TabOrder = 5
      end
      object edtComplemento: TEdit
        Left = 92
        Top = 90
        Width = 121
        Height = 21
        TabOrder = 4
      end
      object edtBairro: TEdit
        Left = 92
        Top = 126
        Width = 167
        Height = 21
        TabOrder = 6
      end
      object btnBuscar: TButton
        Left = 227
        Top = 18
        Width = 75
        Height = 25
        Caption = 'Buscar CEP'
        TabOrder = 1
        OnClick = btnBuscarClick
      end
    end
    object edtNome: TEdit
      Left = 128
      Top = 45
      Width = 306
      Height = 21
      TabOrder = 0
    end
    object edtIdentidade: TEdit
      Left = 128
      Top = 77
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtCPF: TEdit
      Left = 297
      Top = 77
      Width = 137
      Height = 21
      TabOrder = 2
    end
    object edtTelefone: TEdit
      Left = 128
      Top = 110
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtEmail: TEdit
      Left = 128
      Top = 149
      Width = 306
      Height = 21
      TabOrder = 4
    end
    object btnSalvar: TButton
      Left = 608
      Top = 45
      Width = 121
      Height = 53
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = btnSalvarClick
    end
    object btnCancel: TButton
      Left = 32
      Top = 400
      Width = 545
      Height = 25
      Caption = 'Fechar'
      TabOrder = 10
      OnClick = btnCancelClick
    end
    object btnExcluir: TButton
      Left = 608
      Top = 144
      Width = 121
      Height = 53
      Caption = 'Excluir'
      TabOrder = 7
      OnClick = btnExcluirClick
    end
    object btnEmail: TButton
      Left = 608
      Top = 240
      Width = 121
      Height = 53
      Caption = 'Enviar Email'
      TabOrder = 8
      OnClick = btnEmailClick
    end
    object btnNovo: TButton
      Left = 608
      Top = 324
      Width = 121
      Height = 53
      Caption = 'Novo'
      TabOrder = 9
      OnClick = btnNovoClick
    end
    object btnLocalizar: TButton
      Left = 448
      Top = 75
      Width = 73
      Height = 25
      Caption = 'Localizar'
      TabOrder = 11
      OnClick = btnLocalizarClick
    end
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 360
    Top = 200
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 440
    Top = 200
  end
end
