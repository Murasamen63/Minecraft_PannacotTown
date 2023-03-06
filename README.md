# Minecraft-PannacotTown

## Version

Minecraft JavaEdition - ver1.19.3

## コーディング書式

コーディング書式は以下のサイトを参考にさせて頂きます。

* Minecraft Datapack

    https://mc-datapacks.github.io/en/index.html
* convetion - ProjectTSB/TheSkyBlessing

    https://github.com/ProjectTSB/TheSkyBlessing/wiki/convetion

## 命名規則

命名には基本的に以下のルールを元に作成しています。

### scoreboard

全体名と使用企画名を付けています。

例) 
```
・PCTW.Core.Const  全体で使用する整数用のscoreboard
・PCTW.FSBT.GameTimer  釣り大会用のタイマー      etc...
```

### tag

上記と同じように全体名と使用企画名に加え、使用するエンティティの名前を入れています。

例)
```
・PCTW.FSBT.Player 釣り大会に参加するプレイヤーに付けるタグ      etc...
```

### Item:CustomTags

上記と同じく、全体名と使用企画名を付けていますが、
.（カンマ）が使えない為、PascalCaseを使用します。

例)
```
・PCTWItems  バニラアイテムと企画用アイテムを区別する為のCustomTag
・FSBTHookedItem  釣り大会での釣果アイテムのCustomTag      etc...
```