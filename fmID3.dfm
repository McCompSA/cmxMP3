object frmID3: TfrmID3
  Left = 437
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ID3 record'
  ClientHeight = 366
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitle: TLabel
    Left = 16
    Top = 25
    Width = 24
    Height = 13
    Caption = 'Title'
  end
  object lblArtist: TLabel
    Left = 16
    Top = 81
    Width = 30
    Height = 13
    Caption = 'Artist'
  end
  object lblAlbum: TLabel
    Left = 16
    Top = 137
    Width = 36
    Height = 13
    Caption = 'Album'
  end
  object lblComment: TLabel
    Left = 16
    Top = 193
    Width = 56
    Height = 13
    Caption = 'Comment'
  end
  object lblTrack: TLabel
    Left = 296
    Top = 137
    Width = 32
    Height = 13
    Caption = 'Track'
  end
  object lblYear: TLabel
    Left = 296
    Top = 25
    Width = 26
    Height = 13
    Caption = 'Year'
  end
  object lblGenre: TLabel
    Left = 16
    Top = 256
    Width = 35
    Height = 13
    Caption = 'Genre'
  end
  object btnOK: TButton
    Left = 184
    Top = 321
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    TabOrder = 6
    OnClick = btnOKClick
  end
  object bntCancel: TButton
    Left = 272
    Top = 321
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    TabOrder = 7
    OnClick = bntCancelClick
  end
  object edtTitle: TEdit
    Left = 16
    Top = 41
    Width = 257
    Height = 21
    MaxLength = 30
    TabOrder = 0
  end
  object edtArtist: TEdit
    Left = 16
    Top = 97
    Width = 257
    Height = 21
    MaxLength = 30
    TabOrder = 2
  end
  object edtAlbum: TEdit
    Left = 16
    Top = 153
    Width = 257
    Height = 21
    MaxLength = 30
    TabOrder = 3
  end
  object edtComment: TEdit
    Left = 16
    Top = 209
    Width = 241
    Height = 21
    MaxLength = 28
    TabOrder = 5
  end
  object speTrack: TSpinEdit
    Left = 296
    Top = 153
    Width = 49
    Height = 22
    MaxLength = 3
    MaxValue = 255
    MinValue = 0
    TabOrder = 4
    Value = 0
  end
  object speYear: TSpinEdit
    Left = 296
    Top = 41
    Width = 57
    Height = 22
    MaxLength = 4
    MaxValue = 9999
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object cboGenre: TComboBox
    Left = 16
    Top = 272
    Width = 241
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
end
