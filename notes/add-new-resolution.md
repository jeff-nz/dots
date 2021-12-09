## Adding new resolution for a 2560x1080

#### Adding new resolution for an ultrawide screen 2560x1080 @ 60Hz

```
gtf 2560 1080 60 
```

#### You might get something like :

```
# 2560x1080 @ 60.00 Hz (GTF) hsync: 67.08 kHz; pclk: 230.76 MHz
  Modeline "2560x1080_60.00"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync
```

#### Then create the new mode using xrandr with the above data :

```
xrandr --newmode "2560x1080_60.00"  230.76  2560 2728 3000 3440  1080 1081 1084 1118  -HSync +Vsync
```

#### To add the mode to HDMI1:

```
xrandr --addmode HDMI1 "2560x1080_60.00"
```

#### Finally to apply the new mode :

```
xrandr --output HDMI1 --mode "2560x1080_60.00"
```
