object _remotecheck: T_remotecheck
  Left = 189
  Top = 127
  Width = 549
  Height = 158
  BorderIcons = [biSystemMenu, biMinimize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    533
    119)
  PixelsPerInch = 96
  TextHeight = 13
  object pnmain: TPanel
    Left = 0
    Top = 0
    Width = 533
    Height = 119
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      533
      119)
    object Bevel1: TBevel
      Left = 12
      Top = 20
      Width = 419
      Height = 82
      Anchors = [akLeft, akTop, akRight, akBottom]
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 32
      Top = 40
      Width = 67
      Height = 13
      Caption = 'Windows Title'
    end
    object Label2: TLabel
      Left = 32
      Top = 68
      Width = 49
      Height = 13
      Caption = 'Text Send'
    end
    object cmdSendKeys: TButton
      Left = 442
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Send'
      Default = True
      TabOrder = 0
      OnClick = cmdSendKeysClick
    end
    object nmClose: TButton
      Left = 442
      Top = 64
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      TabOrder = 1
      OnClick = nmCloseClick
    end
    object edTitle: TEdit
      Left = 112
      Top = 40
      Width = 301
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
    object edSend: TEdit
      Left = 112
      Top = 64
      Width = 229
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object cbCrlf: TCheckBox
      Left = 352
      Top = 68
      Width = 61
      Height = 17
      Caption = 'CRLF'
      TabOrder = 4
    end
  end
  object tmr: TTimer
    Enabled = False
    OnTimer = tmrTimer
    Left = 40
    Top = 136
  end
end
