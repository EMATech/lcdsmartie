object Form2: TForm2
  Left = 21
  Top = 181
  Anchors = []
  BiDiMode = bdLeftToRight
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'LCD Smartie 5.3 Setup'
  ClientHeight = 410
  ClientWidth = 812
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 233
    Height = 409
    ActivePage = TabSheet6
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    TabPosition = tpRight
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Winamp'
      object SpeedButton3: TSpeedButton
        Left = 160
        Top = 328
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888000000000008888800333333333088880B0333333333
          08880FB03333333330880BFB0333333333080FBFB000000000000BFBFBFBFB08
          88880FBFBFBFBF0888880BFB0000000888888000888888880008888888888888
          8008888888880888080888888888800088888888888888888888}
        OnClick = SpeedButton3Click
      end
      object Label55: TLabel
        Left = 8
        Top = 312
        Width = 104
        Height = 13
        Caption = 'Winamp.exe location:'
      end
      object ListBox7: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 265
        ItemHeight = 13
        Items.Strings = (
          'TrackTitle'
          'Channels (stereo/mono)'
          'kbps'
          'KHz'
          'Time (seconds)'
          'Time (hrs + min + sec) (long)'
          'Time (hrs + min + sec) (short)'
          'Remaining Time (seconds)'
          'Remaining (hrs+min+sec) (long)'
          'Remaining (hrs+min+sec) (short)'
          'Total length (seconds)'
          'Total length (hrs + min + sec)(long)'
          'Total length (hrs + min + sec)(short)'
          'Position(10) (bar) '
          'playlist number of current track'
          'total tracks in playlist'
          'Current Status')
        TabOrder = 0
        OnClick = ListBox7Click
        OnDblClick = Button3Click
      end
      object Edit15: TEdit
        Left = 8
        Top = 328
        Width = 153
        Height = 21
        TabOrder = 1
        Text = 'Edit15'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Sysinfo'
      ImageIndex = 1
      object SpeedButton2: TSpeedButton
        Left = 16
        Top = 0
        Width = 17
        Height = 17
        AllowAllUp = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333FF3333333333333003333333333333F77F33333333333009033
          333333333F7737F333333333009990333333333F773337FFFFFF330099999000
          00003F773333377777770099999999999990773FF33333FFFFF7330099999000
          000033773FF33777777733330099903333333333773FF7F33333333333009033
          33333333337737F3333333333333003333333333333377333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
      object ListBox6: TListBox
        Left = 0
        Top = 0
        Width = 185
        Height = 329
        ItemHeight = 13
        Items.Strings = (
          'Username'
          'Computername'
          'CPU Type'
          'CPU Speed'
          'CPU usage (%)'
          'CPU usage Bar (length)'
          'Free Memory'
          'Used Memory'
          'Total Memory'
          'Free Memory (%)'
          'Used Memory (%)'
          'Free Memory bar (length)'
          'Used Memory bar (length)'
          'Free Pagefile'
          'Used Pagefile'
          'Total Pagefile'
          'Free Pagefile (%)'
          'Used Pagefile (%)'
          'Free Pagefile Bar (length)'
          'Used Pagefile Bar (length)'
          'Free space on drive(X) (MB)'
          'Used space on drive(X) (MB)'
          'Total space on drive(X) (MB)'
          'Free space on drive(X) (GB)'
          'Used space on drive(X) (GB)'
          'Total space on drive(X) (GB)'
          'Free space on drive(X) (%)'
          'Used space on drive(X) (%)'
          'Free space Bar drive(X,Length)'
          'Used space Bar drive(X,Length)'
          'Screen Resolution')
        TabOrder = 0
        OnClick = ListBox6Click
        OnDblClick = Button3Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'MBM'
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      object Label38: TLabel
        Left = 8
        Top = 336
        Width = 97
        Height = 13
        Caption = 'Refresh time (secs):'
      end
      object ListBox5: TListBox
        Left = 0
        Top = 0
        Width = 185
        Height = 321
        ItemHeight = 13
        Items.Strings = (
          'Temperature 1'
          'Temperature 2'
          'Temperature 3'
          'Temperature 4'
          'Temperature 5'
          'Temperature 6'
          'Temperature 7'
          'Temperature 8'
          'Temperature 9'
          'Temperature 10'
          'Fan speed 1'
          'Fan speed 2'
          'Fan speed 3'
          'Fan speed 4'
          'Fan speed 5'
          'Fan speed 6'
          'Fan speed 7'
          'Fan speed 8'
          'Fan speed 9'
          'Fan speed 10'
          'Voltage 1'
          'Voltage 2'
          'Voltage 3'
          'Voltage 4'
          'Voltage 5'
          'Voltage 6'
          'Voltage 7'
          'Voltage 8'
          'Voltage 9'
          'Voltage 10'
          'Temperature name 1'
          'Temperature name 2'
          'Temperature name 3'
          'Temperature name 4'
          'Temperature name 5'
          'Temperature name 6'
          'Temperature name 7'
          'Temperature name 8'
          'Temperature name 9'
          'Temperature name 10'
          'Fan name 1'
          'Fan name 2'
          'Fan name 3'
          'Fan name 4'
          'Fan name 5'
          'Fan name 6'
          'Fan name 7'
          'Fan name 8'
          'Fan name 9'
          'Fan name 10'
          'Voltage name 1'
          'Voltage name 2'
          'Voltage name 3'
          'Voltage name 4'
          'Voltage name 5'
          'Voltage name 6'
          'Voltage name 7'
          'Voltage name 8'
          'Voltage name 9'
          'Voltage name 10')
        TabOrder = 0
        OnClick = ListBox5Click
        OnDblClick = Button3Click
      end
      object SpinEdit6: TSpinEdit
        Left = 120
        Top = 328
        Width = 55
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        MaxValue = 360
        MinValue = 10
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Value = 10
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Gamestats'
      ImageIndex = 4
      object Label11: TLabel
        Left = 8
        Top = 312
        Width = 36
        Height = 13
        Caption = 'Server:'
      end
      object Label12: TLabel
        Left = 8
        Top = 120
        Width = 149
        Height = 13
        Caption = 'The gamestats are made by an'
      end
      object Label13: TLabel
        Left = 8
        Top = 136
        Width = 87
        Height = 13
        Caption = 'external program;'
      end
      object Label15: TLabel
        Left = 128
        Top = 136
        Width = 4
        Height = 13
        Caption = '.'
      end
      object Label16: TLabel
        Left = 100
        Top = 136
        Width = 28
        Height = 13
        Cursor = crHandPoint
        Caption = 'QStat'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = Label16Click
      end
      object Label37: TLabel
        Left = 8
        Top = 240
        Width = 97
        Height = 13
        Caption = 'Refresh time (mins):'
      end
      object Label35: TLabel
        Left = 32
        Top = 192
        Width = 3
        Height = 13
      end
      object Label40: TLabel
        Left = 8
        Top = 272
        Width = 56
        Height = 13
        Caption = 'Game type:'
      end
      object Edit10: TEdit
        Left = 16
        Top = 328
        Width = 161
        Height = 21
        Hint = 'servername:portnumber portnumber is optional.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Text = 'Edit10'
        OnExit = Edit10Exit
      end
      object ComboBox6: TComboBox
        Left = 16
        Top = 288
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = ComboBox6Change
        Items.Strings = (
          'Half-life'
          'Quake II'
          'Quake III'
          'Unreal / Unreal Tournament')
      end
      object SpinEdit5: TSpinEdit
        Left = 122
        Top = 232
        Width = 55
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        MaxValue = 10080
        MinValue = 1
        ParentFont = False
        TabOrder = 0
        Value = 3
      end
      object ListBox8: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 57
        ItemHeight = 13
        Items.Strings = (
          'server name'
          'current map'
          'number of players on server'
          'number of frags for each player')
        TabOrder = 3
        OnClick = ListBox8Click
        OnDblClick = Button3Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Internet'
      ImageIndex = 5
      object Label36: TLabel
        Left = 8
        Top = 288
        Width = 97
        Height = 13
        Caption = 'Refresh time (mins):'
      end
      object ListBox2: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 265
        ItemHeight = 13
        Items.Strings = (
          'BBC World News'
          'BBC UK News'
          'Tweakers.net headlines (Dutch)'
          'The Register headlines'
          'Slashdot'
          'Wired News'
          'The Monty Fool (top item)'
          'The Monty Fool (all items)'
          'Latest LCD Smartie News'
          'Latest PalmOrb News'
          'Latest Weather: FL (US)'
          'BBC News business'
          'The Washington Post business'
          'Yahoo! entertainment'
          'New York Times health'
          'New York Times sports'
          'SecurityFocus news'
          'Volkskrant economie (Dutch)'
          '3voor12 (Dutch)'
          'Algemeen Dagblad (Dutch)'
          'Atletiek nieuws (Dutch)'
          'RTL (French)'
          'Tagesschau (German)')
        TabOrder = 0
        OnClick = ListBox2Click
        OnDblClick = Button3Click
      end
      object SpinEdit3: TSpinEdit
        Left = 120
        Top = 280
        Width = 55
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        MaxValue = 10080
        MinValue = 1
        ParentFont = False
        TabOrder = 1
        Value = 3
      end
      object CheckBox15: TCheckBox
        Left = 2
        Top = 328
        Width = 177
        Height = 17
        Caption = 'Check for LCD Smartie updates'
        TabOrder = 2
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Seti@Home'
      ImageIndex = 7
      object Label41: TLabel
        Left = 3
        Top = 312
        Width = 171
        Height = 13
        Caption = 'Email address used with Seti@home'
      end
      object ListBox3: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 265
        ItemHeight = 13
        Items.Strings = (
          'Total number of WU'#39's done'
          'Total CPU time'
          'Average CPU Time per work unit '
          'time of last result returned'
          'time you are SETI@home user'
          'Total users'
          'Your rank'
          'users you share your rank with'
          'completed more work then ...')
        TabOrder = 0
        OnClick = ListBox3Click
        OnDblClick = Button3Click
      end
      object Edit1: TEdit
        Left = 0
        Top = 328
        Width = 177
        Height = 21
        TabOrder = 1
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Folding@Home'
      ImageIndex = 9
      object Label23: TLabel
        Left = 8
        Top = 312
        Width = 143
        Height = 13
        Caption = 'Username for Folding@Home:'
      end
      object Edit2: TEdit
        Left = 8
        Top = 328
        Width = 169
        Height = 21
        TabOrder = 0
        Text = 'BobC'
      end
      object ListBox10: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 265
        ItemHeight = 13
        Items.Strings = (
          'WU'
          'Date of last work unit'
          'Active processors (within a week)'
          'Team'
          'Score'
          'User Rank'
          '')
        TabOrder = 1
        OnClick = ListBox10Click
        OnDblClick = Button3Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Email'
      ImageIndex = 7
      object Label31: TLabel
        Left = 8
        Top = 256
        Width = 36
        Height = 13
        Caption = 'Server:'
      end
      object Label32: TLabel
        Left = 8
        Top = 280
        Width = 55
        Height = 13
        Caption = 'Loginname:'
      end
      object Label33: TLabel
        Left = 8
        Top = 304
        Width = 50
        Height = 13
        Caption = 'Password:'
      end
      object Label48: TLabel
        Left = 8
        Top = 336
        Width = 113
        Height = 13
        Caption = 'Email check time (mins):'
      end
      object Label50: TLabel
        Left = 8
        Top = 224
        Width = 69
        Height = 13
        Caption = 'Email account:'
      end
      object Label28: TLabel
        Left = 56
        Top = 192
        Width = 56
        Height = 13
        Caption = 'POP3 only'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit13: TEdit
        Left = 64
        Top = 296
        Width = 113
        Height = 21
        PasswordChar = '*'
        TabOrder = 4
        Text = 'Ur passw'
      end
      object Edit12: TEdit
        Left = 64
        Top = 272
        Width = 113
        Height = 21
        TabOrder = 3
        Text = 'Ur loginname'
      end
      object Edit11: TEdit
        Left = 64
        Top = 248
        Width = 113
        Height = 21
        TabOrder = 2
        Text = 'Ur Server'
      end
      object SpinEdit4: TSpinEdit
        Left = 120
        Top = 328
        Width = 55
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 5
        MaxValue = 10080
        MinValue = 1
        ParentFont = False
        TabOrder = 5
        Value = 3
      end
      object ListBox4: TListBox
        Left = 0
        Top = 0
        Width = 185
        Height = 177
        ItemHeight = 13
        Items.Strings = (
          'Email 1: Message Count'
          'Email 1: Last Subject'
          'Email 1: Last From'
          'Email 2: Message Count'
          'Email 2: Last Subject'
          'Email 2: Last From'
          'Email 3: Message Count'
          'Email 3: Last Subject'
          'Email 3: Last From'
          'Email 4: Message Count'
          'Email 4: Last Subject'
          'Email 4: Last From'
          'Email 5: Message Count'
          'Email 5: Last Subject'
          'Email 5: Last From'
          'Email 6: Message Count'
          'Email 6: Last Subject'
          'Email 6: Last From'
          'Email 7: Message Count'
          'Email 7: Last Subject'
          'Email 7: Last From'
          'Email 8: Message Count'
          'Email 8: Last Subject'
          'Email 8: Last From'
          'Email 9: Message Count'
          'Email 9: Last Subject'
          'Email 9: Last From'
          'Email 10: Message Count'
          'Email 10: Last Subject'
          'Email 10: Last From')
        TabOrder = 0
        OnClick = ListBox4Click
        OnDblClick = Button3Click
      end
      object ComboBox8: TComboBox
        Left = 104
        Top = 216
        Width = 73
        Height = 21
        Style = csDropDownList
        DropDownCount = 10
        ItemHeight = 13
        TabOrder = 1
        OnChange = ComboBox8Change
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10')
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Network Stats'
      ImageIndex = 8
      object ListBox9: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 353
        ItemHeight = 13
        Items.Strings = (
          'Adapter name (adapterNr)'
          'Total Down (adapterNr)  (KB)'
          'Total up (adapterNr)  (KB)'
          'Total Down (adapterNr)  (MB)'
          'Total up (adapterNr)  (MB)'
          'Total Down (adapterNr)  (GB)'
          'Total up (adapterNr)  (GB)'
          'Speed Down (adapterNr)  (KB)'
          'Speed Up (adapterNr)  (KB)'
          'Speed Down (adapterNr)  (MB)'
          'Speed Up (adapterNr)  (MB)'
          'Errors down (adapterNr)'
          'Errors up (adapterNr)'
          'Total Errors (adapterNr)'
          'Unicast Packets down (adapterNr)'
          'Unicast Packets up (adapterNr)'
          'Total Uni. Packets (adapterNr)'
          'Non-Uni. Packets down (adapterNr)'
          'Non-Uni. Packets up (adapterNr)'
          'Total Non-Uni. Packets (adapterNr)'
          'Total nr of Packets (adapterNr)'
          'Discards down (adapterNr)'
          'Discards up (adapterNr)'
          'Total Discards (adapterNr)'
          'IP address')
        TabOrder = 0
        OnClick = ListBox9Click
        OnDblClick = Button3Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Misc.'
      ImageIndex = 6
      object SpeedButton1: TSpeedButton
        Left = 160
        Top = 304
        Width = 23
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888000000000008888800333333333088880B0333333333
          08880FB03333333330880BFB0333333333080FBFB000000000000BFBFBFBFB08
          88880FBFBFBFBF0888880BFB0000000888888000888888880008888888888888
          8008888888880888080888888888800088888888888888888888}
        OnClick = SpeedButton1Click
      end
      object Label34: TLabel
        Left = 8
        Top = 312
        Width = 107
        Height = 13
        Caption = 'Distributed.net logfile:'
      end
      object Label58: TLabel
        Left = 8
        Top = 288
        Width = 114
        Height = 13
        Caption = 'DLL check interval (ms):'
      end
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 265
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        Items.Strings = (
          'Distributed.net RC5/OGR speed'
          'Distributed.net RC5/OGR done'
          'DateTime'
          'Uptime long (wks, dys, hrs, min, sec)'
          'Uptime short (days, hours, minutes)'
          'Degree symbol ('#176')'
          'Block ('#382')'
          '$Chr(20)'
          '$File(C:\file.txt,2)  (2=2nd line)'
          '$LogFile(C:\file.txt,0-3) (last-2 line)'
          '$dll(demo.dll,5,param1,param2)'
          '$Count(101#$CPUSpeed#4)'
          '$Bar(current,total,length)'
          '$Right(text here,$length)'
          '$Fill(10) places next text at pos 10'
          '$Flash(text here$)$'
          '$CustomChar(1,31,31,31,31,31,31,31,31)'
          '$Rss(URL,t|d|b,ITEM#,MAXFREQHRS)'
          '$Center(text here,width)'
          '$ScreenChanged')
        ParentFont = False
        ScrollWidth = 250
        TabOrder = 0
        OnClick = ListBox1Click
        OnDblClick = Button3Click
      end
      object Edit14: TEdit
        Left = 8
        Top = 328
        Width = 153
        Height = 21
        TabOrder = 1
      end
      object SpinEdit8: TSpinEdit
        Left = 128
        Top = 280
        Width = 49
        Height = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        MaxValue = 1000
        MinValue = 5
        ParentFont = False
        TabOrder = 2
        Value = 200
      end
    end
    object TabSheet13: TTabSheet
      Caption = 'LCD Features'
      Enabled = False
      ImageIndex = 10
      object Label27: TLabel
        Left = 8
        Top = 184
        Width = 157
        Height = 13
        Caption = 'When you insert a button please'
      end
      object Label29: TLabel
        Left = 8
        Top = 200
        Width = 161
        Height = 13
        Caption = 'first press the button (see below)'
      end
      object Label56: TLabel
        Left = 8
        Top = 320
        Width = 85
        Height = 13
        Caption = 'Last key pressed:'
      end
      object Label30: TLabel
        Left = 8
        Top = 232
        Width = 167
        Height = 13
        Caption = 'The buttons get the value '#39'1'#39' when'
      end
      object Label57: TLabel
        Left = 8
        Top = 248
        Width = 83
        Height = 13
        Caption = 'they are pushed.'
      end
      object ListBox12: TListBox
        Left = 0
        Top = 0
        Width = 180
        Height = 177
        ItemHeight = 13
        Items.Strings = (
          'Buttons')
        TabOrder = 0
        OnClick = ListBox12Click
        OnDblClick = Button3Click
      end
      object Edit17: TEdit
        Left = 96
        Top = 312
        Width = 33
        Height = 21
        Enabled = False
        MaxLength = 1
        TabOrder = 1
      end
    end
  end
  object Button1: TButton
    Left = 576
    Top = 384
    Width = 75
    Height = 25
    Caption = '&Ok'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 656
    Top = 384
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit9: TEdit
    Left = 8
    Top = 376
    Width = 121
    Height = 17
    TabStop = False
    BorderStyle = bsNone
    Color = clBtnFace
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = '[Variable]'
  end
  object Button3: TButton
    Left = 128
    Top = 368
    Width = 59
    Height = 25
    Hint = 
      'Insert the above chosen variable into the currently active scree' +
      'n line.'
    Caption = '&Insert -->'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button7: TButton
    Left = 736
    Top = 384
    Width = 75
    Height = 25
    Caption = '&Apply'
    TabOrder = 5
    OnClick = Button7Click
  end
  object PageControl2: TPageControl
    Left = 232
    Top = 0
    Width = 577
    Height = 377
    ActivePage = TabSheet11
    TabOrder = 6
    OnChange = PageControl2Change
    object TabSheet11: TTabSheet
      Caption = 'Screens'
      object GroupBox1: TGroupBox
        Left = 3
        Top = 168
        Width = 561
        Height = 177
        BiDiMode = bdLeftToRight
        Caption = 'Screens settings'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 0
        object Label5: TLabel
          Left = 9
          Top = 46
          Width = 67
          Height = 13
          Caption = 'Time to show:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 200
          Top = 56
          Width = 90
          Height = 13
          Caption = 'Skip this screen if: '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 19
          Top = 57
          Width = 47
          Height = 13
          Caption = '(seconds)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label44: TLabel
          Left = 432
          Top = 8
          Width = 25
          Height = 13
          Caption = 'Don'#39't'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label45: TLabel
          Left = 432
          Top = 24
          Width = 24
          Height = 13
          Caption = 'scroll'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label47: TLabel
          Left = 436
          Top = 56
          Width = 20
          Height = 13
          Caption = 'line:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label46: TLabel
          Left = 436
          Top = 40
          Width = 17
          Height = 13
          Caption = 'this'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label51: TLabel
          Left = 467
          Top = 8
          Width = 43
          Height = 13
          Caption = 'Continue'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label52: TLabel
          Left = 482
          Top = 24
          Width = 12
          Height = 13
          Caption = 'on'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label53: TLabel
          Left = 477
          Top = 40
          Width = 22
          Height = 13
          Caption = 'next'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label54: TLabel
          Left = 480
          Top = 56
          Width = 20
          Height = 13
          Caption = 'line:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 520
          Top = 8
          Width = 33
          Height = 13
          Caption = 'Center'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 526
          Top = 24
          Width = 24
          Height = 13
          Caption = 'text:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 200
          Top = 24
          Width = 49
          Height = 13
          Caption = 'Theme nr.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object CheckBox3: TCheckBox
          Left = 432
          Top = 80
          Width = 25
          Height = 17
          Hint = 'Don'#39't scroll this line.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object CheckBox4: TCheckBox
          Left = 432
          Top = 104
          Width = 25
          Height = 17
          Hint = 'Don'#39't scroll this line.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object CheckBox5: TCheckBox
          Left = 432
          Top = 128
          Width = 25
          Height = 17
          Hint = 'Don'#39't scroll this line.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object CheckBox6: TCheckBox
          Left = 432
          Top = 152
          Width = 25
          Height = 17
          Hint = 'Don'#39't scroll this line.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object GroupBox4: TGroupBox
          Left = 464
          Top = 8
          Width = 2
          Height = 161
          TabOrder = 7
        end
        object CheckBox7: TCheckBox
          Left = 480
          Top = 80
          Width = 17
          Height = 17
          Hint = 'Continue text that doesn'#39't fit on line 1 onto line 2.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = CheckBox7Click
        end
        object CheckBox8: TCheckBox
          Left = 480
          Top = 104
          Width = 17
          Height = 17
          Hint = 'Continue text that doesn'#39't fit on line 2 onto line 3.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = CheckBox8Click
        end
        object CheckBox9: TCheckBox
          Left = 480
          Top = 128
          Width = 17
          Height = 17
          Hint = 'Continue text that doesn'#39't fit on line 3 onto line 4.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = CheckBox9Click
        end
        object GroupBox5: TGroupBox
          Left = 512
          Top = 8
          Width = 2
          Height = 161
          TabOrder = 8
        end
        object CheckBox10: TCheckBox
          Left = 528
          Top = 80
          Width = 17
          Height = 17
          Hint = 'Center the text in this line (if it'#39's shorter than a full line).'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
        object CheckBox11: TCheckBox
          Left = 528
          Top = 104
          Width = 17
          Height = 17
          Hint = 'Center the text in this line (if it'#39's shorter than a full line).'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
        end
        object CheckBox12: TCheckBox
          Left = 528
          Top = 128
          Width = 17
          Height = 17
          Hint = 'Center the text in this line (if it'#39's shorter than a full line).'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
        end
        object CheckBox13: TCheckBox
          Left = 528
          Top = 152
          Width = 17
          Height = 17
          Hint = 'Center the text in this line (if it'#39's shorter than a full line).'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
        end
        object GroupBox6: TGroupBox
          Left = 424
          Top = 8
          Width = 2
          Height = 57
          TabOrder = 13
        end
        object SpinEdit7: TSpinEdit
          Left = 256
          Top = 16
          Width = 41
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          MaxValue = 10
          MinValue = 1
          ParentFont = False
          TabOrder = 14
          Value = 1
        end
        object Button10: TButton
          Left = 336
          Top = 16
          Width = 83
          Height = 25
          Hint = 'Choose an effect to display when changing from this screen.'
          Caption = 'Interactions'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 15
          OnClick = Button10Click
        end
        object Sticky: TCheckBox
          Left = 128
          Top = 54
          Width = 49
          Height = 17
          Hint = 'Don'#39't automatically change from this screen.'
          Caption = 'Sticky'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          OnClick = StickyClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 0
        Width = 270
        Height = 166
        Caption = 'Program settings'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 48
          Width = 134
          Height = 13
          Caption = 'Scroll interval (milliseconds):'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 16
          Top = 120
          Width = 91
          Height = 13
          Caption = 'Web proxy server:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 16
          Top = 144
          Width = 80
          Height = 13
          Caption = 'Web proxy port:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 16
          Top = 88
          Width = 68
          Height = 13
          Caption = 'Color scheme:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label59: TLabel
          Left = 16
          Top = 24
          Width = 147
          Height = 13
          Caption = 'Refresh interval (milliseconds):'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Edit3: TEdit
          Left = 120
          Top = 112
          Width = 129
          Height = 21
          Hint = 'Web proxy for web access (such as for Rss feeds).'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object Edit4: TEdit
          Left = 168
          Top = 136
          Width = 81
          Height = 21
          Hint = 'Web proxy port for web access (such as for Rss feeds).'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 5
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '0'
        end
        object ComboBox1: TComboBox
          Left = 136
          Top = 83
          Width = 113
          Height = 21
          Hint = 'The colors used in the virtual display.'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Items.Strings = (
            'Green'
            'Blue'
            'Yellow'
            'White'
            'Custom for this skin')
        end
      end
      object SpinEdit1: TSpinEdit
        Left = 196
        Top = 16
        Width = 57
        Height = 22
        Hint = 'How often screen text is sent to display (in mSec).'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        MaxValue = 1000
        MinValue = 5
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Value = 200
      end
      object GroupBox2: TGroupBox
        Left = 280
        Top = 0
        Width = 284
        Height = 166
        Caption = 'LCD settings'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object Label9: TLabel
          Left = 32
          Top = 120
          Width = 50
          Height = 13
          Caption = 'COM port:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 152
          Top = 120
          Width = 85
          Height = 13
          Caption = 'Speed/baud rate:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 73
          Top = 19
          Width = 44
          Height = 13
          Caption = 'LCD size:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RadioButton1: TRadioButton
          Left = 16
          Top = 48
          Width = 113
          Height = 17
          Hint = 
            'Select if your display is HD44780 compatiable display connected ' +
            'to the parallel port..'
          Caption = 'HD44780 (Parallel)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = RadioButton1Click
        end
        object RadioButton2: TRadioButton
          Left = 16
          Top = 72
          Width = 145
          Height = 17
          Hint = 'Select if your display is a serial/Usb Matrix Orbital display.'
          Caption = 'Matrix Orbital (Serial)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = RadioButton2Click
        end
        object ComboBox4: TComboBox
          Left = 29
          Top = 136
          Width = 105
          Height = 21
          Hint = 
            'The serial port (or for usb devices, the virtual serial port) th' +
            'at your display is attached to.'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
        end
        object ComboBox5: TComboBox
          Left = 149
          Top = 136
          Width = 105
          Height = 21
          Hint = 
            'The serial speed of your display - please refer to your displays' +
            ' documentation.'
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          Items.Strings = (
            '110 bps'
            '300 bps'
            '600 bps'
            '1200 bps'
            '2400 bps'
            '4800 bps'
            '9600 bps'
            '14400 bps'
            '19200 bps'
            '38400 bps'
            '56000 bps'
            '57600 bps'
            '115200 bps'
            '128000 bps'
            '256000 bps')
        end
        object Button4: TButton
          Left = 152
          Top = 72
          Width = 113
          Height = 17
          Hint = 'Set Matrix Orbital display specific settings.'
          Caption = '&Matrix Orbital settings'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = Button4Click
        end
        object RadioButton3: TRadioButton
          Left = 16
          Top = 96
          Width = 121
          Height = 17
          Hint = 'Select if your display is a serial/usb Crystalfontz display.'
          Caption = 'Crystalfontz (Serial)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = RadioButton3Click
        end
        object Button5: TButton
          Left = 152
          Top = 96
          Width = 113
          Height = 17
          Hint = 'Set Crystalfontz display specific settings.'
          Caption = '&Crystalfontz settings'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 152
          Top = 48
          Width = 113
          Height = 17
          Hint = 'Set HD44780 compatible display specific settings.'
          Caption = '&HD44780 settings'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = Button6Click
        end
        object ComboBox2: TComboBox
          Left = 133
          Top = 12
          Width = 77
          Height = 21
          Hint = 'The size of your display in characters (lines X width). '
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnChange = ComboBox2Change
          Items.Strings = (
            '1 x 10'
            '1 x 16'
            '1 x 20'
            '1 x 24'
            '1 x 40'
            '2 x 16'
            '2 x 20'
            '2 x 24'
            '2 x 40'
            '4 x 16'
            '4 x 20'
            '4 x 40')
        end
      end
      object ComboBox3: TComboBox
        Left = 80
        Top = 184
        Width = 81
        Height = 21
        Hint = 'Selects the current screen for editing'
        Style = csDropDownList
        DropDownCount = 10
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = ComboBox3Change
        Items.Strings = (
          'Screen 1'
          'Screen 2'
          'Screen 3'
          'Screen 4'
          'Screen 5'
          'Screen 6'
          'Screen 7'
          'Screen 8'
          'Screen 9'
          'Screen 10'
          'Screen 11'
          'Screen 12'
          'Screen 13'
          'Screen 14'
          'Screen 15'
          'Screen 16'
          'Screen 17'
          'Screen 18'
          'Screen 19'
          'Screen 20')
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 188
        Width = 65
        Height = 17
        Hint = 'Show this screen automatically'
        Caption = 'Enabled'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
      end
      object SpinEdit2: TSpinEdit
        Left = 80
        Top = 215
        Width = 41
        Height = 22
        Hint = 
          'How long the screen should be shown for before moving to the nex' +
          't.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 2
        MaxValue = 99
        MinValue = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Value = 3
      end
      object Edit5: TEdit
        Left = 8
        Top = 245
        Width = 417
        Height = 23
        TabStop = False
        BevelEdges = []
        Color = 10606500
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnEnter = Edit5Enter
        OnKeyDown = Edit5KeyDown
      end
      object Edit6: TEdit
        Left = 8
        Top = 269
        Width = 417
        Height = 23
        TabStop = False
        BevelEdges = []
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
        OnEnter = Edit6Enter
        OnKeyDown = Edit6KeyDown
      end
      object Edit7: TEdit
        Left = 8
        Top = 293
        Width = 417
        Height = 23
        TabStop = False
        BevelEdges = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnEnter = Edit7Enter
        OnKeyDown = Edit7KeyDown
      end
      object Edit8: TEdit
        Left = 8
        Top = 317
        Width = 417
        Height = 23
        TabStop = False
        BevelEdges = []
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnEnter = Edit8Enter
        OnKeyDown = Edit8KeyDown
      end
      object ComboBox7: TComboBox
        Left = 288
        Top = 216
        Width = 129
        Height = 21
        Hint = 
          'Skip this screen for automatic selection if the condition is tru' +
          'e.'
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        Items.Strings = (
          'Don'#39't skip'
          'Winamp is inactive'
          'Winamp is active'
          'MBM is inactive'
          'MBM is active'
          'There is no new E-Mail'
          'There is new E-Mail'
          'Not connected'
          'Connected')
      end
      object SpinEdit9: TSpinEdit
        Left = 196
        Top = 42
        Width = 57
        Height = 22
        Hint = 
          'How fast to scroll (in mSec). Should be greater than refresh int' +
          'erval.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 4
        MaxValue = 50000
        MinValue = 20
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        Value = 200
      end
    end
    object TabSheet12: TTabSheet
      Caption = 'Actions'
      ImageIndex = 1
      object Label24: TLabel
        Left = 4
        Top = 294
        Width = 8
        Height = 13
        Caption = 'If'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label25: TLabel
        Left = 244
        Top = 294
        Width = 24
        Height = 13
        Caption = 'Then'
      end
      object Label26: TLabel
        Left = 397
        Top = 1
        Width = 42
        Height = 13
        Caption = 'Output:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object StringGrid1: TStringGrid
        Left = 0
        Top = 0
        Width = 393
        Height = 281
        DefaultColWidth = 77
        DefaultRowHeight = 16
        FixedCols = 0
        RowCount = 1
        FixedRows = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = StringGrid1Click
      end
      object ListBox11: TListBox
        Left = 397
        Top = 16
        Width = 169
        Height = 329
        ItemHeight = 13
        Items.Strings = (
          'Next Theme'
          'Last Theme'
          'Next screen'
          'Last screen'
          'Goto Theme(2)'
          'Goto Screen(2)'
          'Freeze/unfreeze screen'
          'Refresh all data'
          'Backlight(0/1) (0=off 1=on)'
          'BacklightToggle'
          'Backlight Flash(5) (nr. of times)'
          'PlayWave[c:\wave.wav]'
          'Execute[c:\autoexec.bat]'
          'Winamp next track'
          'Winamp last track'
          'Winamp play'
          'Winamp stop'
          'Winamp pause'
          'Winamp Shuffle (toggle)'
          'Winamp volume down'
          'Winamp volume up'
          'EnableScreen(1-20)'
          'DisableScreen(1-20)'
          '$dll(name.dll,2,param1,param2)'
          'GPO(1-8,0/1)  (0=off 1=on)'
          'GPOToggle(1-8)'
          'GPOFlash(1-8,2)  (nr. of times)'
          'Fan(1-3,0-255) (0-255=speed)')
        TabOrder = 1
        OnClick = ListBox11Click
      end
      object Edit16: TEdit
        Left = 16
        Top = 288
        Width = 105
        Height = 21
        TabOrder = 2
      end
      object ComboBox9: TComboBox
        Left = 124
        Top = 288
        Width = 41
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        TabStop = False
        Items.Strings = (
          '>'
          '<'
          '='
          '<='
          '>='
          '<>')
      end
      object Edit18: TEdit
        Left = 272
        Top = 288
        Width = 113
        Height = 21
        TabOrder = 4
        Text = 'Backlight(1)'
      end
      object Button8: TButton
        Left = 312
        Top = 312
        Width = 75
        Height = 25
        Caption = 'Add'
        TabOrder = 5
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 232
        Top = 312
        Width = 75
        Height = 25
        Caption = '&Delete'
        TabOrder = 6
        OnClick = Button9Click
      end
      object Edit19: TEdit
        Left = 168
        Top = 288
        Width = 73
        Height = 21
        TabOrder = 7
        Text = 'Edit19'
      end
    end
    object TabSheet14: TTabSheet
      Caption = 'Startup'
      ImageIndex = 2
      object GroupBox7: TGroupBox
        Left = 8
        Top = 16
        Width = 201
        Height = 81
        Hint = 'These settings are for when starting with windows.'
        Caption = 'Autostart'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object NoAutoStart: TRadioButton
          Left = 8
          Top = 24
          Width = 169
          Height = 17
          Caption = 'Don'#39't autostart with windows'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object AutoStart: TRadioButton
          Left = 8
          Top = 40
          Width = 113
          Height = 17
          Caption = 'Autostart'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object AutoStartHide: TRadioButton
          Left = 8
          Top = 56
          Width = 177
          Height = 17
          Caption = 'Autostart hidden (in system tray)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 104
        Width = 201
        Height = 49
        Hint = 
          'These settings are for when starting apply to all start methods ' +
          '(by hand or autostart).'
        Caption = 'Start options'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        object HideOnStartup: TCheckBox
          Left = 8
          Top = 24
          Width = 185
          Height = 17
          Caption = 'Always start hidden'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object CheckBox14: TCheckBox
    Left = 384
    Top = 384
    Width = 113
    Height = 17
    Hint = 
      'Rather than automatically selecting in sequence, chose them rand' +
      'omly.'
    Caption = '&Randomize screens'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 240
    Top = 384
    Width = 81
    Height = 17
    Caption = '&Stay on top'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
  end
  object RadioButton4: TRadioButton
    Left = 488
    Top = 448
    Width = 113
    Height = 17
    Caption = 'Parallel (HD66712)'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = RadioButton4Click
  end
  object OpenDialog2: TOpenDialog
    DefaultExt = '*.*'
    Filter = 
      'All files (*.*)|*.*|Text files (*.txt)|*.txt|Log files (*.log)|*' +
      '.log'
    InitialDir = 'C:\'
    Title = 'Open distributed.net logfile'
    Left = 512
    Top = 384
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.exe'
    FileName = 'Winamp.exe'
    Filter = 'Executables (*.exe)|*.exe|All Files (*.*)|*.*'
    InitialDir = 'C:\program files\winamp'
    Left = 540
    Top = 384
  end
end
