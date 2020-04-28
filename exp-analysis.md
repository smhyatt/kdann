
# Result Analysis

## main: 

### runtime 

futhark dataget main.fut "5i32 8i32 [100000][8]f32 [100000][8]f32"    | ./main -t /dev/stderr

699643

### knn indexes

[[99780i32, 40201i32, 83703i32, 41086i32, 16500i32], [99407i32, 79615i32, 20623i32, 66625i32, 15718i32], [99649i32, 15718i32, 76628i32, 35501i32, 2537i32], [98340i32, 74936i32, 41326i32, 23200i32, 18820i32], [99564i32, 66543i32, 68904i32, 85045i32, 77914i32], [79397i32, 20684i32, 70618i32, 42516i32, 85600i32], [79845i32, 83460i32, 30706i32, 10309i32, 87625i32], [79869i32, 50758i32, 85928i32, 6270i32, 49405i32], [77995i32, 92939i32, 54745i32, 80263i32, 64784i32], [77914i32, 49060i32, 72040i32, 68344i32, 70889i32], [74238i32, 27309i32, 66543i32, 70442i32, 73552i32], [75142i32, 40197i32, 44019i32, 6286i32, 18198i32], [76597i32, 42117i32, 731i32, 69106i32, 51257i32], [76628i32, 99649i32, 2191i32, 26174i32, 66781i32], [77090i32, 32034i32, 37878i32, 90115i32, 71067i32], [77761i32, 25406i32, 60784i32, 35329i32, 85558i32]]


### knn values

[[0.000000f32, 0.241599f32, 0.270631f32, 0.274587f32, 0.278686f32], [0.000000f32, 0.225836f32, 0.230166f32, 0.254593f32, 0.256740f32], [0.000000f32, 0.164186f32, 0.204229f32, 0.213700f32, 0.218654f32], [0.000000f32, 0.175486f32, 0.224825f32, 0.245006f32, 0.265932f32], [0.000000f32, 0.152855f32, 0.199108f32, 0.235618f32, 0.265743f32], [0.000000f32, 0.214116f32, 0.241914f32, 0.244999f32, 0.247195f32], [0.000000f32, 0.212469f32, 0.231859f32, 0.241539f32, 0.256836f32], [0.000000f32, 0.192180f32, 0.238586f32, 0.249309f32, 0.256492f32], [0.000000f32, 0.235659f32, 0.244744f32, 0.254253f32, 0.259492f32], [0.000000f32, 0.212321f32, 0.250372f32, 0.253190f32, 0.263405f32], [0.000000f32, 0.209848f32, 0.225603f32, 0.257522f32, 0.288832f32], [0.000000f32, 0.126888f32, 0.230502f32, 0.255303f32, 0.258299f32], [0.000000f32, 0.157257f32, 0.227649f32, 0.235316f32, 0.270111f32], [0.000000f32, 0.204229f32, 0.212583f32, 0.224089f32, 0.227808f32], [0.000000f32, 0.229645f32, 0.285668f32, 0.289754f32, 0.307642f32], [0.000000f32, 0.227227f32, 0.232899f32, 0.239065f32, 0.283450f32]]



### visited

[24725i32, 2762i32, 376i32, 66i32, 17i32, 5i32, -1i32, -1i32]




### runtime

futhark dataget main.fut "7i32 12i32 [1200000][8]f32 [1200000][8]f32"    | ./main -t /dev/stderr

8396208


### knn indexes

[[1121023i32, 18717i32, 1051892i32, 727932i32, 896885i32, 589757i32, 15522i32], [1134812i32, 103399i32, 201444i32, 213998i32, 576767i32, 66314i32, 42610i32], [1120863i32, 451713i32, 260877i32, 165717i32, 595710i32, 292261i32, 122721i32], [1077692i32, 776909i32, 19452i32, 171742i32, 598451i32, 1100528i32, 899145i32], [1146712i32, 527159i32, 362182i32, 896885i32, 671631i32, 277020i32, 687292i32], [1113906i32, 428310i32, 1040173i32, 40009i32, 846160i32, 1090603i32, 389188i32], [1096883i32, 167545i32, 597074i32, 804932i32, 734050i32, 827431i32, 102737i32], [1104664i32, 589757i32, 405691i32, 514119i32, 896885i32, 306929i32, 225833i32], [1074213i32, 1009793i32, 201444i32, 242360i32, 498392i32, 707228i32, 760804i32], [1051892i32, 15522i32, 1018549i32, 813134i32, 18717i32, 323759i32, 544059i32], [1053545i32, 374678i32, 422633i32, 527159i32, 274955i32, 720265i32, 230108i32], [465115i32, 790321i32, 32480i32, 451073i32, 772775i32, 838545i32, 152177i32], [443751i32, 392634i32, 28633i32, 330713i32, 319305i32, 438527i32, 780956i32], [452092i32, 857516i32, 6294i32, 975929i32, 1036340i32, 587594i32, 139349i32], [451713i32, 430478i32, 929375i32, 1120863i32, 161130i32, 184879i32, 381003i32], [451073i32, 535439i32, 32480i32, 465115i32, 464498i32, 105095i32, 381003i32]]



### knn values

[[0.000000f32, 0.183072f32, 0.209086f32, 0.216376f32, 0.239529f32, 0.241739f32, 0.243332f32], [0.000000f32, 0.203487f32, 0.204545f32, 0.205951f32, 0.215119f32, 0.215403f32, 0.223500f32], [0.000000f32, 0.159489f32, 0.182794f32, 0.190711f32, 0.194379f32, 0.196236f32, 0.197808f32], [0.000000f32, 0.108829f32, 0.123144f32, 0.166219f32, 0.168701f32, 0.191506f32, 0.192531f32], [0.000000f32, 0.159043f32, 0.168144f32, 0.181631f32, 0.183875f32, 0.198166f32, 0.198246f32], [0.000000f32, 0.173979f32, 0.181553f32, 0.184411f32, 0.189417f32, 0.198728f32, 0.199218f32], [0.000000f32, 0.118038f32, 0.157201f32, 0.176547f32, 0.187599f32, 0.191864f32, 0.203561f32], [0.000000f32, 0.144282f32, 0.187435f32, 0.201995f32, 0.208976f32, 0.210726f32, 0.210813f32], [0.000000f32, 0.180702f32, 0.184243f32, 0.190998f32, 0.204469f32, 0.209717f32, 0.216074f32], [0.000000f32, 0.143846f32, 0.161261f32, 0.178548f32, 0.181430f32, 0.185627f32, 0.190991f32], [0.000000f32, 0.144863f32, 0.168883f32, 0.172824f32, 0.176806f32, 0.182846f32, 0.189060f32], [0.000000f32, 0.131882f32, 0.146452f32, 0.151206f32, 0.158238f32, 0.187477f32, 0.190000f32], [0.000000f32, 0.155731f32, 0.179155f32, 0.181462f32, 0.183712f32, 0.186114f32, 0.187069f32], [0.000000f32, 0.144146f32, 0.147330f32, 0.155561f32, 0.162918f32, 0.169123f32, 0.210709f32], [0.000000f32, 0.121684f32, 0.135061f32, 0.159489f32, 0.181523f32, 0.186150f32, 0.191054f32], [0.000000f32, 0.142228f32, 0.150428f32, 0.151206f32, 0.163636f32, 0.171826f32, 0.178011f32]]



### visited

[1115503i32, 713116i32, 359893i32, 168960i32, 78297i32, 36939i32, 17806i32, 8873i32, 4641i32, 2585i32, 1441i32, 860i32, 521i32, 321i32, 197i32, 113i32, 69i32, 46i32, 32i32, 21i32, 16i32, 9i32, 3i32, 1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32]



## partition:


### runtime 

futhark dataget partition.fut "5i32 8i32 [100000][8]f32 [100000][8]f32"    | ./partition -t /dev/stderr

274107

### knn indexes

[[83210i32, 73520i32, 39846i32, 67473i32, 46675i32], [95024i32, 18183i32, 28223i32, 85219i32, 17266i32], [79068i32, 52738i32, 80613i32, 14251i32, 89417i32], [14161i32, 81340i32, 38675i32, 74677i32, 38867i32], [13290i32, 24667i32, 15518i32, 39254i32, 617i32], [79069i32, 17060i32, 77079i32, 81362i32, 1411i32], [17224i32, 9850i32, 13157i32, 57832i32, 37809i32], [83211i32, 79213i32, 40176i32, 10184i32, 66699i32], [91863i32, 48460i32, 77733i32, 3104i32, 19268i32], [70487i32, 70482i32, 86855i32, 97892i32, 70234i32], [65866i32, 35892i32, 4107i32, 3886i32, 96798i32], [4370i32, 19475i32, 36232i32, 20146i32, 98299i32], [87867i32, 96851i32, 63675i32, 78636i32, 22632i32], [17225i32, 33338i32, 70426i32, 70148i32, 50092i32], [3822i32, 35585i32, 36983i32, 85001i32, 56945i32], [83212i32, 79036i32, 10997i32, 78298i32, 60240i32]]



### knn values

[[0.000000f32, 0.197598f32, 0.200588f32, 0.218889f32, 0.228893f32], [0.000000f32, 0.209544f32, 0.245786f32, 0.288061f32, 0.296422f32], [0.000000f32, 0.182982f32, 0.251857f32, 0.258689f32, 0.268899f32], [0.000000f32, 0.148915f32, 0.185575f32, 0.193588f32, 0.224701f32], [0.000000f32, 0.194199f32, 0.197426f32, 0.212781f32, 0.228100f32], [0.000000f32, 0.226922f32, 0.246637f32, 0.258202f32, 0.264459f32], [0.000000f32, 0.225891f32, 0.227978f32, 0.245979f32, 0.247019f32], [0.000000f32, 0.278082f32, 0.302944f32, 0.305103f32, 0.318388f32], [0.000000f32, 0.239884f32, 0.253099f32, 0.265430f32, 0.293826f32], [0.000000f32, 0.000000f32, 0.214425f32, 0.226102f32, 0.233449f32], [0.000000f32, 0.220707f32, 0.232403f32, 0.267913f32, 0.273974f32], [0.000000f32, 0.228028f32, 0.266418f32, 0.271990f32, 0.272458f32], [0.000000f32, 0.233411f32, 0.235166f32, 0.259127f32, 0.269573f32], [0.000000f32, 0.190328f32, 0.204939f32, 0.215267f32, 0.224106f32], [0.000000f32, 0.219073f32, 0.246623f32, 0.251552f32, 0.254133f32], [0.000000f32, 0.274501f32, 0.280017f32, 0.282519f32, 0.286948f32]]



### visited 

[2050i32, 156i32, 11i32, 3i32, -1i32, -1i32, -1i32, -1i32]




### runtime

futhark dataget partition.fut "7i32 12i32 [1200000][8]f32 [1200000][8]f32"    | ./partition -t /dev/stderr

2970247

### knn indexes

[[498849i32, 861302i32, 1110321i32, 581939i32, 1123550i32, 913239i32, 1142916i32], [1174128i32, 307110i32, 545276i32, 70471i32, 1027364i32, 455376i32, 927810i32], [1154530i32, 792257i32, 371228i32, 214900i32, 424591i32, 973112i32, 1177798i32], [50565i32, 183882i32, 617230i32, 1016965i32, 317183i32, 612700i32, 132232i32], [259257i32, 803594i32, 289419i32, 1011873i32, 1081182i32, 175124i32, 346772i32], [573162i32, 310891i32, 867157i32, 377007i32, 1113680i32, 272638i32, 36567i32], [279170i32, 497650i32, 1045534i32, 1164158i32, 572592i32, 1187060i32, 183311i32], [906852i32, 689484i32, 246017i32, 295435i32, 249404i32, 34387i32, 106563i32], [836759i32, 338465i32, 341828i32, 662555i32, 790714i32, 776967i32, 704594i32], [720575i32, 448648i32, 1023528i32, 489495i32, 1058420i32, 908485i32, 159830i32], [860227i32, 505965i32, 925986i32, 858959i32, 254643i32, 932279i32, 778061i32], [13632i32, 1115178i32, 457404i32, 353122i32, 1019506i32, 218888i32, 969582i32], [1127809i32, 681692i32, 960143i32, 743822i32, 5957i32, 302372i32, 1036719i32], [676206i32, 591839i32, 847963i32, 243128i32, 202739i32, 623507i32, 273732i32], [98473i32, 478790i32, 292838i32, 372089i32, 729750i32, 328797i32, 305318i32], [997680i32, 563711i32, 289992i32, 89528i32, 999867i32, 59489i32, 743982i32]]


### knn values

[[0.000000f32, 0.161065f32, 0.179227f32, 0.179771f32, 0.185592f32, 0.198762f32, 0.199752f32], [0.000000f32, 0.152525f32, 0.161998f32, 0.201466f32, 0.205029f32, 0.215912f32, 0.219204f32], [0.000000f32, 0.173632f32, 0.186536f32, 0.190228f32, 0.197659f32, 0.208033f32, 0.222961f32], [0.000000f32, 0.136336f32, 0.155650f32, 0.169287f32, 0.179305f32, 0.184898f32, 0.193115f32], [0.000000f32, 0.168469f32, 0.171857f32, 0.172530f32, 0.178413f32, 0.181325f32, 0.187026f32], [0.000000f32, 0.105749f32, 0.140980f32, 0.166209f32, 0.169178f32, 0.178101f32, 0.178962f32], [0.000000f32, 0.122179f32, 0.159225f32, 0.164766f32, 0.185739f32, 0.192979f32, 0.197192f32], [0.000000f32, 0.128235f32, 0.155569f32, 0.163200f32, 0.169397f32, 0.186381f32, 0.187644f32], [0.000000f32, 0.151280f32, 0.151293f32, 0.160796f32, 0.162630f32, 0.165017f32, 0.183817f32], [0.000000f32, 0.118716f32, 0.134410f32, 0.135881f32, 0.145007f32, 0.154257f32, 0.172326f32], [0.000000f32, 0.176974f32, 0.181746f32, 0.196979f32, 0.208883f32, 0.212111f32, 0.213715f32], [0.000000f32, 0.161873f32, 0.163070f32, 0.167524f32, 0.174343f32, 0.187373f32, 0.193547f32], [0.000000f32, 0.171574f32, 0.178162f32, 0.198434f32, 0.203642f32, 0.204491f32, 0.235095f32], [0.000000f32, 0.199677f32, 0.210651f32, 0.224194f32, 0.230594f32, 0.231094f32, 0.236787f32], [0.000000f32, 0.147728f32, 0.164256f32, 0.179668f32, 0.182952f32, 0.187351f32, 0.188542f32], [0.000000f32, 0.121261f32, 0.132347f32, 0.151108f32, 0.166653f32, 0.189415f32, 0.193741f32]]




### visited

[249939i32, 23933i32, 2702i32, 360i32, 42i32, 6i32, 2i32, 1i32, 1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32]



### After fix with ongoing_knns in partition

4259991

[[0i32, 17859i32, 976792i32, 105686i32, 672838i32, 491133i32, 644174i32], [1i32, 768461i32, 417943i32, 474548i32, 165628i32, 477790i32, 788519i32], [2i32, 339633i32, 1171997i32, 34919i32, 626055i32, 1111862i32, 532262i32], [3i32, 45560i32, 662564i32, 284105i32, 447697i32, 48022i32, 110893i32], [4i32, 937870i32, 783440i32, 669053i32, 1125893i32, 467023i32, 642388i32], [5i32, 255317i32, 770061i32, 730608i32, 947181i32, 1089419i32, 962664i32], [6i32, 666280i32, 1021041i32, 721406i32, 922732i32, 916424i32, 1065844i32], [7i32, 45963i32, 205318i32, 98015i32, 135332i32, 1126832i32, 1060080i32], [8i32, 124742i32, 351405i32, 464209i32, 1000013i32, 640801i32, 926159i32], [9i32, 1170768i32, 286319i32, 892598i32, 769526i32, 1194772i32, 239533i32], [10i32, 247588i32, 158000i32, 44313i32, 1198112i32, 346171i32, 996950i32], [11i32, 675455i32, 645302i32, 465112i32, 877611i32, 502326i32, 237650i32], [12i32, 1191909i32, 282741i32, 720700i32, 1057103i32, 1173615i32, 1157363i32], [13i32, 728231i32, 58389i32, 673156i32, 1012685i32, 465195i32, 193509i32], [14i32, 541705i32, 722802i32, 722436i32, 605566i32, 465438i32, 92444i32], [15i32, 432301i32, 633245i32, 412952i32, 732517i32, 174693i32, 15895i32]]

[[0.000000f32, 0.155236f32, 0.188588f32, 0.189181f32, 0.192960f32, 0.193769f32, 0.204515f32], [0.000000f32, 0.137763f32, 0.171306f32, 0.174497f32, 0.174786f32, 0.180755f32, 0.181494f32], [0.000000f32, 0.100453f32, 0.165096f32, 0.174265f32, 0.180890f32, 0.200103f32, 0.203599f32], [0.000000f32, 0.124010f32, 0.147701f32, 0.158028f32, 0.165896f32, 0.170555f32, 0.174672f32], [0.000000f32, 0.167033f32, 0.183629f32, 0.198519f32, 0.201959f32, 0.202429f32, 0.209138f32], [0.000000f32, 0.149221f32, 0.168423f32, 0.179943f32, 0.181160f32, 0.192487f32, 0.197649f32], [0.000000f32, 0.183241f32, 0.184524f32, 0.192709f32, 0.196420f32, 0.205538f32, 0.206387f32], [0.000000f32, 0.181210f32, 0.184940f32, 0.187769f32, 0.198725f32, 0.199954f32, 0.203614f32], [0.000000f32, 0.158207f32, 0.166168f32, 0.183939f32, 0.187841f32, 0.188312f32, 0.193107f32], [0.000000f32, 0.181577f32, 0.185458f32, 0.189718f32, 0.193201f32, 0.194722f32, 0.197330f32], [0.000000f32, 0.177136f32, 0.187872f32, 0.192153f32, 0.193566f32, 0.201883f32, 0.202894f32], [0.000000f32, 0.093316f32, 0.113017f32, 0.141815f32, 0.147190f32, 0.177673f32, 0.182652f32], [0.000000f32, 0.163192f32, 0.163347f32, 0.163470f32, 0.176548f32, 0.181440f32, 0.181778f32], [0.000000f32, 0.160826f32, 0.165452f32, 0.191592f32, 0.193418f32, 0.199688f32, 0.204497f32], [0.000000f32, 0.161239f32, 0.167397f32, 0.172289f32, 0.176309f32, 0.183625f32, 0.185376f32], [0.000000f32, 0.163120f32, 0.180238f32, 0.194142f32, 0.201627f32, 0.208305f32, 0.209441f32]]

[287670i32, 35459i32, 5526i32, 1098i32, 236i32, 64i32, 25i32, 7i32, 1i32, 1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32, -1i32]












## brute force



### runtime

futhark dataget brute.fut "5i32 [100000][8]f32 [100000][8]f32"    | ./brute -t /dev/stderr


### knn indexes


### knn values


### visited



### runtime

futhark dataget brute.fut "7i32 [1200000][8]f32 [1200000][8]f32"    | ./brute -t /dev/stderr >> results/bruteforce.txt


### knn indexes


### knn values

[[0.000000f32, 0.155236f32, 0.188588f32, 0.189181f32, 0.192960f32, 0.193769f32, 0.204515f32], [0.000000f32, 0.137763f32, 0.171306f32, 0.174497f32, 0.174786f32, 0.180755f32, 0.181494f32], [0.000000f32, 0.100453f32, 0.165096f32, 0.174265f32, 0.180890f32, 0.200103f32, 0.203599f32], [0.000000f32, 0.124010f32, 0.147701f32, 0.158028f32, 0.165896f32, 0.170555f32, 0.174672f32], [0.000000f32, 0.167033f32, 0.183629f32, 0.198519f32, 0.201959f32, 0.202429f32, 0.209138f32], [0.000000f32, 0.115435f32, 0.149221f32, 0.168265f32, 0.168423f32, 0.176306f32, 0.179943f32], [0.000000f32, 0.183241f32, 0.184524f32, 0.192709f32, 0.196420f32, 0.205538f32, 0.206387f32], [0.000000f32, 0.181210f32, 0.184940f32, 0.187769f32, 0.198725f32, 0.199954f32, 0.203614f32], [0.000000f32, 0.158207f32, 0.166168f32, 0.175060f32, 0.183939f32, 0.187841f32, 0.188312f32], [0.000000f32, 0.170340f32, 0.171690f32, 0.181577f32, 0.185188f32, 0.185458f32, 0.189718f32], [0.000000f32, 0.177136f32, 0.187872f32, 0.192153f32, 0.193566f32, 0.201883f32, 0.202511f32], [0.000000f32, 0.093316f32, 0.113017f32, 0.141815f32, 0.147190f32, 0.177673f32, 0.182652f32],







[zfj900@a00333 kdann]$ futhark bench --backend=opencl -r 1 main.fut
Compiling main.fut...
Results for main.fut:
dataset data/testinput.in: 3482134.00μs (avg. of 1 runs; RSD: 0.00)

[zfj900@a00333 kdann]$ futhark bench --backend=opencl -r 1 partition.fut
Compiling partition.fut...
Results for partition.fut:
dataset data/testinput.in: 4737026.00μs (avg. of 1 runs; RSD: 0.00)






futhark dataset --f32-bounds=0:1 -g "7i32" -g "12i32" -g "[1048576][8]f32" -g "[1048576][8]f32"  > data/testinput.in


futhark dataset --f32-bounds=0:1 -g "7i32" -g "[1048576][8]f32" -g "[1048576][8]f32"  > data/brutetestinput.in




futhark dataset --i32-bounds=7:7 -g "7i32" --i32-bounds=12:12 -g "12i32" --f32-bounds=0:1 -g "[1048576][8]f32" --f32-bounds=0:1 -g  "[1048576][8]f32"  > data/testinput.in


futhark dataset --i32-bounds=7:7 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [1048576][8]f32 --f32-bounds=0:1 -g [1048576][8]f32 > data/testinput.in


futhark dataset --i32-bounds=7:7 -g i32 --f32-bounds=0:1 -g [1048576][8]f32 --f32-bounds=0:1 -g [1048576][8]f32 > data/brutetestinput.in


futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [1048576][8]f32 --f32-bounds=0:1 -g [1048576][8]f32 > my.in


futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [1048576][8]f32 --f32-bounds=0:1 -g [1048576][8]f32 > testinput.in




futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [1048576][8]f32 --f32-bounds=0:1 -g [1048576][8]f32 > my.in



dim: 1, 4, 6, 8, 16
k: 1, 3, 5, 7, 17


h+1 	data size 	ppl		k	dim
------------------------------------
9   	131072    	256				
11  	524288    	256				
12  	1048576   	256				
13  	2097152   	256				
12  	1048576   	256				
13  	2097152   	256				
14  	4194304   	256				



**Sorting over Partition**


h+1 	data size 	data size 	ppl		k	dim
------------------------------------------------
9   	131072    	131072    	256				
11  	524288    	524288    	256				
12  	1048576   	1048576   	256				
13  	2097152   	2097152   	256				
12  	1048576   	1048576   	256				
13  	2097152   	2097152   	256				
14  	4194304   	4194304   	256				


Tests				h+1 	data size 	data size 	ppl		k	dim
---------------------------------------------------------------------
8test-k3-d4			9   	131072    	120000    	256		3	 4  
8test-k3-d16		9   	131072    	120000    	256		3	 16  
8test-k11-d4		9   	131072    	120000    	256		11	 4  
8test-k11-d16		9   	131072    	120000    	256		11	 16  
8test-k3-d4-eq		9   	131072    	131072    	256		3	 4  
8test-k3-d16-eq		9   	131072    	131072    	256		3	 16  
8test-k11-d4-eq		9   	131072    	131072    	256		11	 4  
8test-k11-d16-eq	9   	131072    	131072    	256		11	 16

10test-k3-d4		11  	524288    	580000    	256		3	 4
10test-k3-d8		11  	524288    	580000    	256		3	 8
10test-k7-d4		11  	524288    	580000    	256		7	 4
10test-k7-d8		11  	524288    	580000    	256		7	 8
10test-k3-d4-eq		11  	524288    	524288    	256		3	 4
10test-k3-d8-eq		11  	524288    	524288    	256		3	 8
10test-k7-d4-eq		11  	524288    	524288    	256		7	 4
10test-k7-d8-eq		11  	524288    	524288    	256		7	 8

test				12  	1048576   	1048576   	256				
test				13  	2097152   	2097152   	256				
test				12  	1048576   	1048576   	256				

12test-k3-d4		13  	2097152   	2230000   	256		3	 4 
12test-k3-d16		13  	2097152   	2230000   	256		3	 16 
12test-k11-d4		13  	2097152   	2230000   	256		11	 4 
12test-k11-d16		13  	2097152   	2230000   	256		11	 16 
12test-k3-d4-eq		13  	2097152   	2097152   	256		3	 4 
12test-k3-d16-eq	13  	2097152   	2097152   	256		3	 16 
12test-k11-d4-eq	13  	2097152   	2097152   	256		11	 4 
12test-k11-d16-eq	13  	2097152   	2097152   	256		11	 16

13test-k3-d4		14  	4194304   	3000000   	256		3	 4
13test-k3-d8		14  	4194304   	3000000   	256		3	 8
13test-k7-d4		14  	4194304   	3000000   	256		7	 4
13test-k7-d8		14  	4194304   	3000000   	256		7	 8
13test-k3-d4-eq		14  	4194304   	4194304   	256		3	 4
13test-k3-d8-eq		14  	4194304   	4194304   	256		3	 8
13test-k7-d4-eq		14  	4194304   	4194304   	256		7	 4
13test-k7-d8-eq		14  	4194304   	4194304   	256		7	 8


printf '\nDatasets with size: 131072 and 120000\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1   -g [131072][4]f32 --f32-bounds=0:1  -g [120000][4]f32  > data/sorting/8test-k3-d4.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1   -g [131072][16]f32 --f32-bounds=0:1 -g [120000][16]f32 > data/sorting/8test-k3-d16.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][4]f32 --f32-bounds=0:1  -g [120000][4]f32  > data/sorting/8test-k11-d4.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][16]f32 --f32-bounds=0:1 -g [120000][16]f32 > data/sorting/8test-k11-d16.in


printf '\nDatasets with size: 131072 and 131072\n'
futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1  -g [131072][4]f32 --f32-bounds=0:1 -g [131072][4]f32  > data/sorting/8test-k3-d4-eq.in
futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][16]f32 --f32-bounds=0:1 -g [131072][16]f32 > data/sorting/8test-k3-d16-eq.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1  -g [131072][4]f32 --f32-bounds=0:1 -g [131072][4]f32  > data/sorting/8test-k11-d4-eq.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=8:8 -g i32 --f32-bounds=0:1 -g [131072][16]f32 --f32-bounds=0:1 -g [131072][16]f32 > data/sorting/8test-k11-d16-eq.in


printf '\nDatasets with size: 2097152 and 2230000\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1   -g [2097152][4]f32 --f32-bounds=0:1  -g [2230000][4]f32  > data/sorting/12test-k3-d4.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1   -g [2097152][16]f32 --f32-bounds=0:1 -g [2230000][16]f32 > data/sorting/12test-k3-d16.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][4]f32 --f32-bounds=0:1  -g [2230000][4]f32  > data/sorting/12test-k11-d4.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][16]f32 --f32-bounds=0:1 -g [2230000][16]f32 > data/sorting/12test-k11-d16.in


printf '\nDatasets with size: 2097152 and 2097152\n'
futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][4]f32 --f32-bounds=0:1  -g [2097152][4]f32  > data/sorting/12test-k3-d4-eq.in
futhark dataset -b --i32-bounds=3:3   -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][16]f32 --f32-bounds=0:1 -g [2097152][16]f32 > data/sorting/12test-k3-d16-eq.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][4]f32 --f32-bounds=0:1  -g [2097152][4]f32  > data/sorting/12test-k11-d4-eq.in
futhark dataset -b --i32-bounds=11:11 -g i32 --i32-bounds=12:12 -g i32 --f32-bounds=0:1 -g [2097152][16]f32 --f32-bounds=0:1 -g [2097152][16]f32 > data/sorting/12test-k11-d16-eq.in


### first try of sorting

Results for main.fut:
dataset data/sorting/8test-k3-d4.in:         68522.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16.in:      1306336.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k11-d4.in:        91673.67μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k11-d16.in:     1545662.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d4-eq.in:      61727.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16-eq.in:   2316947.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k11-d4-eq.in:     98146.00μs (avg. of 3 runs; RSD: 0.04)
dataset data/sorting/8test-k11-d16-eq.in:  1816733.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/12test-k3-d4.in:      main.fut failed with error code 1 and output:
./main: Index [2097920] out of bounds for array of shape [2097152].
-> #0  main.fut:126:17-23
   #1  main.fut:125:7-129:16
   #2  main.fut:106:1-184:13

dataset data/sorting/12test-k3-d16.in:     main.fut failed with error code 1 and output:
./main: Index [2097952] out of bounds for array of shape [2097152].
-> #0  main.fut:126:17-23
   #1  main.fut:125:7-129:16
   #2  main.fut:106:1-184:13

dataset data/sorting/12test-k11-d4.in:     main.fut failed with error code 1 and output:
./main: Index [2097920] out of bounds for array of shape [2097152].
-> #0  main.fut:126:17-23
   #1  main.fut:125:7-129:16
   #2  main.fut:106:1-184:13

dataset data/sorting/12test-k11-d16.in:    main.fut failed with error code 1 and output:
./main: Index [2097408] out of bounds for array of shape [2097152].
-> #0  main.fut:126:17-23
   #1  main.fut:125:7-129:16
   #2  main.fut:106:1-184:13

dataset data/sorting/12test-k3-d4-eq.in:    722109.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d16-eq.in:  79057467.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d4-eq.in:  1133415.00μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d16-eq.in: 127700359.00μs (avg. of 3 runs; RSD: 0.02)



### second try of sorting

Results for main.fut:
dataset data/sorting/8test-k3-d4.in:        556700.33μs (avg. of 3 runs; RSD: 1.21)
dataset data/sorting/8test-k3-d16.in:      1523340.00μs (avg. of 3 runs; RSD: 0.03)
dataset data/sorting/8test-k11-d4.in:        99049.33μs (avg. of 3 runs; RSD: 0.14)
dataset data/sorting/8test-k11-d16.in:     3945433.00μs (avg. of 3 runs; RSD: 0.41)
dataset data/sorting/8test-k3-d4-eq.in:     237314.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16-eq.in:   5533058.33μs (avg. of 3 runs; RSD: 0.19)
dataset data/sorting/8test-k11-d4-eq.in:     95187.00μs (avg. of 3 runs; RSD: 0.04)
dataset data/sorting/8test-k11-d16-eq.in:  1942095.67μs (avg. of 3 runs; RSD: 0.11)
dataset data/sorting/12test-k3-d4.in:       871476.67μs (avg. of 3 runs; RSD: 0.18)
dataset data/sorting/12test-k3-d16.in:     71737351.00μs (avg. of 3 runs; RSD: 0.17)
dataset data/sorting/12test-k11-d4.in:     1056601.33μs (avg. of 3 runs; RSD: 0.03)
dataset data/sorting/12test-k11-d16.in:    93256634.00μs (avg. of 3 runs; RSD: 0.02)
dataset data/sorting/12test-k3-d4-eq.in:    774836.00μs (avg. of 3 runs; RSD: 0.05)
dataset data/sorting/12test-k3-d16-eq.in:  75949725.00μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d4-eq.in:  1148170.33μs (avg. of 3 runs; RSD: 0.05)
dataset data/sorting/12test-k11-d16-eq.in: 117716654.33μs (avg. of 3 runs; RSD: 0.01)


### third try of sorting

dataset data/sorting/8test-k3-d4.in:         68614.67μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16.in:      1287140.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k11-d4.in:        91731.67μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k11-d16.in:     1550267.00μs (avg. of 3 runs; RSD: 0.03)
dataset data/sorting/8test-k3-d4-eq.in:      58494.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d16-eq.in:   2238789.00μs (avg. of 3 runs; RSD: 0.02)
dataset data/sorting/8test-k11-d4-eq.in:     94642.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d16-eq.in:  1754700.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/12test-k3-d4.in:       717318.00μs (avg. of 3 runs; RSD: 0.02)
dataset data/sorting/12test-k3-d16.in:     81353278.00μs (avg. of 3 runs; RSD: 0.15)
dataset data/sorting/12test-k11-d4.in:     2187016.00μs (avg. of 3 runs; RSD: 0.41)
dataset data/sorting/12test-k11-d16.in:    172073459.00μs (avg. of 3 runs; RSD: 0.41)
dataset data/sorting/12test-k3-d4-eq.in:   7566183.33μs (avg. of 3 runs; RSD: 0.13)
dataset data/sorting/12test-k3-d16-eq.in:  180681302.33μs (avg. of 3 runs; RSD: 0.78)
dataset data/sorting/12test-k11-d4-eq.in:  1114384.67μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/12test-k11-d16-eq.in: 120381889.33μs (avg. of 3 runs; RSD: 0.01)


## first try of partition

dataset data/sorting/8test-k3-d4.in:         48291.67μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16.in:      2804616.00μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d4.in:        77636.33μs (avg. of 3 runs; RSD: 0.08)
dataset data/sorting/8test-k11-d16.in:     3342884.33μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d4-eq.in:      53854.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16-eq.in:   4818202.67μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k11-d4-eq.in:     79458.33μs (avg. of 3 runs; RSD: 0.10)
dataset data/sorting/8test-k11-d16-eq.in:  5877597.00μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/12test-k3-d4.in:       926225.33μs (avg. of 3 runs; RSD: 0.03)
dataset data/sorting/12test-k3-d16.in:     661491506.00μs (avg. of 3 runs; RSD: 0.06)
dataset data/sorting/12test-k11-d4.in:     1626979.33μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/12test-k11-d16.in:    882439881.00μs (avg. of 3 runs; RSD: 0.03)
dataset data/sorting/12test-k3-d4-eq.in:   1041860.33μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/12test-k3-d16-eq.in:  870679564.33μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d4-eq.in:  1814530.33μs (avg. of 3 runs; RSD: 0.00)


## second try of partition
Results for partition.fut:
dataset data/sorting/8test-k3-d4.in:         47205.33μs (avg. of 3 runs; RSD: 0.01)
dataset data/sorting/8test-k3-d16.in:      2790234.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d4.in:        77608.33μs (avg. of 3 runs; RSD: 0.07)
dataset data/sorting/8test-k11-d16.in:     3357732.00μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d4-eq.in:      52363.00μs (avg. of 3 runs; RSD: 0.06)
dataset data/sorting/8test-k3-d16-eq.in:   4801450.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d4-eq.in:     77096.33μs (avg. of 3 runs; RSD: 0.14)
dataset data/sorting/8test-k11-d16-eq.in:  5866850.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d4.in:       895139.67μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d16.in:     579172471.33μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d4.in:     1606669.33μs (avg. of 3 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d16.in:    919489909.00μs (avg. of 3 runs; RSD: 0.07)
dataset data/sorting/12test-k3-d4-eq.in:   1015346.33μs (avg. of 3 runs; RSD: 0.00)


## third try of partition

Results for partition.fut:
dataset data/sorting/8test-k3-d4.in:        107201.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d16.in:      3298541.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d4.in:        73244.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d16.in:     4040174.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d4-eq.in:      46541.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k3-d16-eq.in:   5935833.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d4-eq.in:    137637.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/8test-k11-d16-eq.in:  11557465.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d4.in:       976847.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d16.in:     626406133.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d4.in:     1622501.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d16.in:    887635414.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d4-eq.in:   1023846.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k3-d16-eq.in:  880398972.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d4-eq.in:  1819314.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/sorting/12test-k11-d16-eq.in: 1487264456.00μs (avg. of 1 runs; RSD: 0.00)





**Traversal with all dimensions**


dim: 1, 4, 6, 8, 16
k: 1, 3, 5, 7, 17

brug 1, 6, 16 og 1, 5, 17


h+1 	data size 	data size 	ppl		k	dim
------------------------------------------------
9   	131072    	131072    	256				
11  	524288    	524288    	256				
12  	1048576   	1048576   	256				
13  	2097152   	2097152   	256				
12  	1048576   	1048576   	256				
13  	2097152   	2097152   	256				
14  	4194304   	4194304   	256				




Tests				h+1 	data size 	data size 	ppl		k	dim
---------------------------------------------------------------------
8test-k3-d4			9   	131072    	120000    	256		3	 4  
8test-k3-d16		9   	131072    	120000    	256		3	 16  
8test-k11-d4		9   	131072    	120000    	256		11	 4  
8test-k11-d16		9   	131072    	120000    	256		11	 16  
8test-k3-d4-eq		9   	131072    	131072    	256		3	 4  
8test-k3-d16-eq		9   	131072    	131072    	256		3	 16  
8test-k11-d4-eq		9   	131072    	131072    	256		11	 4  
8test-k11-d16-eq	9   	131072    	131072    	256		11	 16

10test-k3-d4		11  	524288    	580000    	256		3	 4
10test-k3-d8		11  	524288    	580000    	256		3	 8
10test-k7-d4		11  	524288    	580000    	256		7	 4
10test-k7-d8		11  	524288    	580000    	256		7	 8
10test-k3-d4-eq		11  	524288    	524288    	256		3	 4
10test-k3-d8-eq		11  	524288    	524288    	256		3	 8
10test-k7-d4-eq		11  	524288    	524288    	256		7	 4
10test-k7-d8-eq		11  	524288    	524288    	256		7	 8

11test-k1-d1		12  	1048576   	1048576   	256		1	 1
11test-k1-d6		12  	1048576   	1048576   	256		1	 6
11test-k1-d16		12  	1048576   	1048576   	256		1	 16
11test-k5-d1		12  	1048576   	1048576   	256		5	 1
11test-k5-d6		12  	1048576   	1048576   	256		5	 6
11test-k5-d16		12  	1048576   	1048576   	256		5	 16
11test-k17-d1		12  	1048576   	1048576   	256		17	 1
11test-k17-d6		12  	1048576   	1048576   	256		17	 6
11test-k17-d16		12  	1048576   	1048576   	256		17	 16

12test-k3-d4		13  	2097152   	2230000   	256		3	 4 
12test-k3-d16		13  	2097152   	2230000   	256		3	 16 
12test-k11-d4		13  	2097152   	2230000   	256		11	 4 
12test-k11-d16		13  	2097152   	2230000   	256		11	 16 
12test-k3-d4-eq		13  	2097152   	2097152   	256		3	 4 
12test-k3-d16-eq	13  	2097152   	2097152   	256		3	 16 
12test-k11-d4-eq	13  	2097152   	2097152   	256		11	 4 
12test-k11-d16-eq	13  	2097152   	2097152   	256		11	 16

13test-k1-d1		14  	4194304   	4194304   	256		1	 1
13test-k1-d6		14  	4194304   	4194304   	256		1	 6
13test-k1-d16		14  	4194304   	4194304   	256		1	 16
13test-k5-d1		14  	4194304   	4194304   	256		5	 1
13test-k5-d6		14  	4194304   	4194304   	256		5	 6
13test-k5-d16		14  	4194304   	4194304   	256		5	 16
13test-k17-d1		14  	4194304   	4194304   	256		17	 1
13test-k17-d6		14  	4194304   	4194304   	256		17	 6
13test-k17-d16		14  	4194304   	4194304   	256		17	 16

13test-k3-d4		14  	4194304   	3000000   	256		3	 4
13test-k3-d8		14  	4194304   	3000000   	256		3	 8
13test-k7-d4		14  	4194304   	3000000   	256		7	 4
13test-k7-d8		14  	4194304   	3000000   	256		7	 8
13test-k3-d4-eq		14  	4194304   	4194304   	256		3	 4
13test-k3-d8-eq		14  	4194304   	4194304   	256		3	 8
13test-k7-d4-eq		14  	4194304   	4194304   	256		7	 4
13test-k7-d8-eq		14  	4194304   	4194304   	256		7	 8




printf '\nDatasets with size: 1048576 and 1048576, k:1\n'
futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][1]f32 --f32-bounds=0:1  -g [1048576][1]f32 > data/traverse/13test-k1-d1.in
futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][6]f32 --f32-bounds=0:1  -g [1048576][6]f32 > data/traverse/13test-k1-d6.in
futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][16]f32 --f32-bounds=0:1 -g [1048576][16]f32 > data/traverse/13test-k1-d16.in

printf '\nDatasets with size: 1048576 and 1048576, k:5\n'
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][1]f32 --f32-bounds=0:1  -g [1048576][1]f32 > data/traverse/13test-k5-d1.in
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][6]f32 --f32-bounds=0:1  -g [1048576][6]f32 > data/traverse/13test-k5-d6.in
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][16]f32 --f32-bounds=0:1 -g [1048576][16]f32 > data/traverse/13test-k5-d16.in

printf '\nDatasets with size: 1048576 and 1048576, k:17\n'
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][1]f32 --f32-bounds=0:1  -g [1048576][1]f32 > data/traverse/13test-k17-d1.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][6]f32 --f32-bounds=0:1  -g [1048576][6]f32 > data/traverse/13test-k17-d6.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [1048576][16]f32 --f32-bounds=0:1 -g [1048576][16]f32 > data/traverse/13test-k17-d16.in




printf '\nDatasets with size: 4194304 and 4194304, k:1\n'
futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][1]f32 --f32-bounds=0:1 -g [4194304][1]f32 > data/traverse/13test-k1-d1.in
futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][6]f32 --f32-bounds=0:1 -g [4194304][6]f32 > data/traverse/13test-k1-d6.in
futhark dataset -b --i32-bounds=1:1 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][16]f32 --f32-bounds=0:1 -g [4194304][16]f32 > data/traverse/13test-k1-d16.in

printf '\nDatasets with size: 4194304 and 4194304, k:5\n'
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][1]f32 --f32-bounds=0:1 -g [4194304][1]f32 > data/traverse/13test-k5-d1.in
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][6]f32 --f32-bounds=0:1 -g [4194304][6]f32 > data/traverse/13test-k5-d6.in
futhark dataset -b --i32-bounds=5:5 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][16]f32 --f32-bounds=0:1 -g [4194304][16]f32 > data/traverse/13test-k5-d16.in

printf '\nDatasets with size: 4194304 and 4194304, k:17\n'
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][1]f32 --f32-bounds=0:1 -g [4194304][1]f32 > data/traverse/13test-k17-d1.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][6]f32 --f32-bounds=0:1 -g [4194304][6]f32 > data/traverse/13test-k17-d6.in
futhark dataset -b --i32-bounds=17:17 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][16]f32 --f32-bounds=0:1 -g [4194304][16]f32 > data/traverse/13test-k17-d16.in



### All dimensions


Results for main.fut:
dataset data/traverse/11test-k1-d1.in:    278409.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k1-d6.in:    576889.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k1-d10.in:  3882609.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k5-d1.in:    282767.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k5-d6.in:    727948.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k5-d10.in:  5946092.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k17-d1.in:   675644.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k17-d6.in:  1762943.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k17-d10.in: 9783637.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k1-d1.in:   1012280.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k1-d6.in:   1991181.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k1-d10.in:  10677555.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k5-d1.in:   1041518.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k5-d6.in:   2698815.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k5-d10.in:  19044828.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k17-d1.in:  2342703.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k17-d6.in:  7151400.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k17-d10.in: 36649144.00μs (avg. of 1 runs; RSD: 0.00)


### One dimension

Results for main2.fut:
dataset data/traverse/11test-k1-d1.in:    286836.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k1-d6.in:    704447.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k1-d10.in:  8563637.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k5-d1.in:    289254.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k5-d6.in:    948102.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k5-d10.in:  13082975.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k17-d1.in:   627067.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k17-d6.in:  2367440.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/11test-k17-d10.in: 22904642.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k1-d1.in:   1069709.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k1-d6.in:   2373850.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k1-d10.in:  30748426.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k5-d1.in:   1086467.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k5-d6.in:   3569390.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k5-d10.in:  58172280.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k17-d1.in:  2388423.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k17-d6.in:  9204127.00μs (avg. of 1 runs; RSD: 0.00)
dataset data/traverse/13test-k17-d10.in: 111723194.00μs (avg. of 1 runs; RSD: 0.00)






**Brute Force vs. Fully Optimise**

Tests				h+1 	data size 	data size 	ppl		k	dim
---------------------------------------------------------------------
test				9   	131072    	131072    	256			 
10test-k3-d4		11  	524288    	580000    	256		3	 4
10test-k3-d8		11  	524288    	580000    	256		3	 8
10test-k7-d4		11  	524288    	580000    	256		7	 4
10test-k7-d8		11  	524288    	580000    	256		7	 8
10test-k3-d4-eq		11  	524288    	524288    	256		3	 4
10test-k3-d8-eq		11  	524288    	524288    	256		3	 8
10test-k7-d4-eq		11  	524288    	524288    	256		7	 4
10test-k7-d8-eq		11  	524288    	524288    	256		7	 8
test				12  	1048576   	1048576   	256				
test				13  	2097152   	2097152   	256				
test				12  	1048576   	1048576   	256				
test				13  	2097152   	2097152   	256				
13test-k3-d4		14  	4194304   	3000000   	256		3	 4
13test-k3-d8		14  	4194304   	3000000   	256		3	 8
13test-k7-d4		14  	4194304   	3000000   	256		7	 4
13test-k7-d8		14  	4194304   	3000000   	256		7	 8
13test-k3-d4-eq		14  	4194304   	4194304   	256		3	 4
13test-k3-d8-eq		14  	4194304   	4194304   	256		3	 8
13test-k7-d4-eq		14  	4194304   	4194304   	256		7	 4
13test-k7-d8-eq		14  	4194304   	4194304   	256		7	 8


k h imA imB



printf '\nDatasets with size: 580000 and 524288\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/10test-k3-d4.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/10test-k3-d8.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/10test-k7-d4.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [580000][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/10test-k7-d8.in


printf '\nDatasets with size: 524288 and 524288\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/10test-k3-d4-eq.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/10test-k3-d8-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][4]f32 --f32-bounds=0:1 -g [524288][4]f32 > data/10test-k7-d4-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=10:10 -g i32 --f32-bounds=0:1 -g [524288][8]f32 --f32-bounds=0:1 -g [524288][8]f32 > data/10test-k7-d8-eq.in


printf '\nDatasets with size: 3000000 and 4194304\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/13test-k3-d4.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/13test-k3-d8.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/13test-k7-d4.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [3000000][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/13test-k7-d8.in


printf '\nDatasets with size: 4194304 and 4194304\n'
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/13test-k3-d4-eq.in
futhark dataset -b --i32-bounds=3:3 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/13test-k3-d8-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][4]f32 --f32-bounds=0:1 -g [4194304][4]f32 > data/13test-k7-d4-eq.in
futhark dataset -b --i32-bounds=7:7 -g i32 --i32-bounds=13:13 -g i32 --f32-bounds=0:1 -g [4194304][8]f32 --f32-bounds=0:1 -g [4194304][8]f32 > data/13test-k7-d8-eq.in
















main

[[0.000000f32, 0.183072f32, 0.209086f32, 0.216376f32, 0.239529f32, 0.241739f32, 0.243332f32], [0.000000f32, 0.203487f32, 0.204545f32, 0.205951f32, 0.215119f32, 0.215403f32, 0.223500f32], [0.000000f32, 0.159489f32, 0.182794f32, 0.190711f32, 0.194379f32, 0.196236f32, 0.197808f32], [0.000000f32, 0.108829f32, 0.123144f32, 0.166219f32, 0.168701f32, 0.191506f32, 0.192531f32], [0.000000f32, 0.159043f32, 0.168144f32, 0.181631f32, 0.183875f32, 0.198166f32, 0.198246f32], [0.000000f32, 0.173979f32, 0.181553f32, 0.184411f32, 0.189417f32, 0.198728f32, 0.199218f32], [0.000000f32, 0.118038f32, 0.157201f32, 0.176547f32, 0.187599f32, 0.191864f32, 0.203561f32], [0.000000f32, 0.144282f32, 0.187435f32, 0.201995f32, 0.208976f32, 0.210726f32, 0.210813f32], [0.000000f32, 0.180702f32, 0.184243f32, 0.190998f32, 0.204469f32, 0.209717f32, 0.216074f32], [0.000000f32, 0.143846f32, 0.161261f32, 0.178548f32, 0.181430f32, 0.185627f32, 0.190991f32], [0.000000f32, 0.144863f32, 0.168883f32, 0.172824f32, 0.176806f32, 0.182846f32, 0.189060f32], [0.000000f32, 0.131882f32, 0.146452f32, 0.151206f32, 0.158238f32, 0.187477f32, 0.190000f32], [0.000000f32, 0.155731f32, 0.179155f32, 0.181462f32, 0.183712f32, 0.186114f32, 0.187069f32], [0.000000f32, 0.144146f32, 0.147330f32, 0.155561f32, 0.162918f32, 0.169123f32, 0.210709f32], [0.000000f32, 0.121684f32, 0.135061f32, 0.159489f32, 0.181523f32, 0.186150f32, 0.191054f32], [0.000000f32, 0.142228f32, 0.150428f32, 0.151206f32, 0.163636f32, 0.171826f32, 0.178011f32]]


partition

[[0.000000f32, 0.161065f32, 0.179227f32, 0.179771f32, 0.185592f32, 0.198762f32, 0.199752f32], [0.000000f32, 0.152525f32, 0.161998f32, 0.201466f32, 0.205029f32, 0.215912f32, 0.219204f32], [0.000000f32, 0.173632f32, 0.186536f32, 0.190228f32, 0.197659f32, 0.208033f32, 0.222961f32], [0.000000f32, 0.136336f32, 0.155650f32, 0.169287f32, 0.179305f32, 0.184898f32, 0.193115f32], [0.000000f32, 0.168469f32, 0.171857f32, 0.172530f32, 0.178413f32, 0.181325f32, 0.187026f32], [0.000000f32, 0.105749f32, 0.140980f32, 0.166209f32, 0.169178f32, 0.178101f32, 0.178962f32], [0.000000f32, 0.122179f32, 0.159225f32, 0.164766f32, 0.185739f32, 0.192979f32, 0.197192f32], [0.000000f32, 0.128235f32, 0.155569f32, 0.163200f32, 0.169397f32, 0.186381f32, 0.187644f32], [0.000000f32, 0.151280f32, 0.151293f32, 0.160796f32, 0.162630f32, 0.165017f32, 0.183817f32], [0.000000f32, 0.118716f32, 0.134410f32, 0.135881f32, 0.145007f32, 0.154257f32, 0.172326f32], [0.000000f32, 0.176974f32, 0.181746f32, 0.196979f32, 0.208883f32, 0.212111f32, 0.213715f32], [0.000000f32, 0.161873f32, 0.163070f32, 0.167524f32, 0.174343f32, 0.187373f32, 0.193547f32], [0.000000f32, 0.171574f32, 0.178162f32, 0.198434f32, 0.203642f32, 0.204491f32, 0.235095f32], [0.000000f32, 0.199677f32, 0.210651f32, 0.224194f32, 0.230594f32, 0.231094f32, 0.236787f32], [0.000000f32, 0.147728f32, 0.164256f32, 0.179668f32, 0.182952f32, 0.187351f32, 0.188542f32], [0.000000f32, 0.121261f32, 0.132347f32, 0.151108f32, 0.166653f32, 0.189415f32, 0.193741f32]]


[[0.000000f32, 0.155236f32, 0.188588f32, 0.189181f32, 0.192960f32, 0.193769f32, 0.204515f32], [0.000000f32, 0.137763f32, 0.171306f32, 0.174497f32, 0.174786f32, 0.180755f32, 0.181494f32], [0.000000f32, 0.100453f32, 0.165096f32, 0.174265f32, 0.180890f32, 0.200103f32, 0.203599f32], [0.000000f32, 0.124010f32, 0.147701f32, 0.158028f32, 0.165896f32, 0.170555f32, 0.174672f32], [0.000000f32, 0.167033f32, 0.183629f32, 0.198519f32, 0.201959f32, 0.202429f32, 0.209138f32], [0.000000f32, 0.149221f32, 0.168423f32, 0.179943f32, 0.181160f32, 0.192487f32, 0.197649f32], [0.000000f32, 0.183241f32, 0.184524f32, 0.192709f32, 0.196420f32, 0.205538f32, 0.206387f32], [0.000000f32, 0.181210f32, 0.184940f32, 0.187769f32, 0.198725f32, 0.199954f32, 0.203614f32], [0.000000f32, 0.158207f32, 0.166168f32, 0.183939f32, 0.187841f32, 0.188312f32, 0.193107f32], [0.000000f32, 0.181577f32, 0.185458f32, 0.189718f32, 0.193201f32, 0.194722f32, 0.197330f32], [0.000000f32, 0.177136f32, 0.187872f32, 0.192153f32, 0.193566f32, 0.201883f32, 0.202894f32], [0.000000f32, 0.093316f32, 0.113017f32, 0.141815f32, 0.147190f32, 0.177673f32, 0.182652f32], [0.000000f32, 0.163192f32, 0.163347f32, 0.163470f32, 0.176548f32, 0.181440f32, 0.181778f32], [0.000000f32, 0.160826f32, 0.165452f32, 0.191592f32, 0.193418f32, 0.199688f32, 0.204497f32], [0.000000f32, 0.161239f32, 0.167397f32, 0.172289f32, 0.176309f32, 0.183625f32, 0.185376f32], [0.000000f32, 0.163120f32, 0.180238f32, 0.194142f32, 0.201627f32, 0.208305f32, 0.209441f32]]


brute

[[0.000000f32, 0.155236f32, 0.188588f32, 0.189181f32, 0.192960f32, 0.193769f32, 0.204515f32], [0.000000f32, 0.137763f32, 0.171306f32, 0.174497f32, 0.174786f32, 0.180755f32, 0.181494f32], [0.000000f32, 0.100453f32, 0.165096f32, 0.174265f32, 0.180890f32, 0.200103f32, 0.203599f32], [0.000000f32, 0.124010f32, 0.147701f32, 0.158028f32, 0.165896f32, 0.170555f32, 0.174672f32], [0.000000f32, 0.167033f32, 0.183629f32, 0.198519f32, 0.201959f32, 0.202429f32, 0.209138f32], [0.000000f32, 0.115435f32, 0.149221f32, 0.168265f32, 0.168423f32, 0.176306f32, 0.179943f32], [0.000000f32, 0.183241f32, 0.184524f32, 0.192709f32, 0.196420f32, 0.205538f32, 0.206387f32], [0.000000f32, 0.181210f32, 0.184940f32, 0.187769f32, 0.198725f32, 0.199954f32, 0.203614f32], [0.000000f32, 0.158207f32, 0.166168f32, 0.175060f32, 0.183939f32, 0.187841f32, 0.188312f32], [0.000000f32, 0.170340f32, 0.171690f32, 0.181577f32, 0.185188f32, 0.185458f32, 0.189718f32], [0.000000f32, 0.177136f32, 0.187872f32, 0.192153f32, 0.193566f32, 0.201883f32, 0.202511f32], [0.000000f32, 0.093316f32, 0.113017f32, 0.141815f32, 0.147190f32, 0.177673f32, 0.182652f32],
























