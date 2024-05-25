; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [128 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [256 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 97
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 96
	i32 38948123, ; 2: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 0
	i32 42244203, ; 3: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 9
	i32 42639949, ; 4: System.Threading.Thread => 0x28aa24d => 117
	i32 67008169, ; 5: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 6: Microsoft.Maui.Graphics.dll => 0x44bb714 => 47
	i32 83839681, ; 7: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 17
	i32 117431740, ; 8: System.Runtime.InteropServices => 0x6ffddbc => 109
	i32 122350210, ; 9: System.Threading.Channels.dll => 0x74aea82 => 116
	i32 136584136, ; 10: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 32
	i32 140062828, ; 11: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 25
	i32 142721839, ; 12: System.Net.WebHeaderCollection => 0x881c32f => 103
	i32 165246403, ; 13: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 54
	i32 182336117, ; 14: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 72
	i32 205061960, ; 15: System.ComponentModel => 0xc38ff48 => 85
	i32 209399409, ; 16: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 52
	i32 317674968, ; 17: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 18: Xamarin.AndroidX.Activity.dll => 0x13031348 => 49
	i32 321963286, ; 19: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 8
	i32 342366114, ; 20: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 61
	i32 375677976, ; 21: System.Net.ServicePoint.dll => 0x16646418 => 101
	i32 379916513, ; 22: System.Threading.Thread.dll => 0x16a510e1 => 117
	i32 385762202, ; 23: System.Memory.dll => 0x16fe439a => 94
	i32 395744057, ; 24: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 409257351, ; 25: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 28
	i32 442565967, ; 26: System.Collections => 0x1a61054f => 82
	i32 450948140, ; 27: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 60
	i32 456227837, ; 28: System.Web.HttpUtility.dll => 0x1b317bfd => 119
	i32 459347974, ; 29: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 469710990, ; 30: System.dll => 0x1bff388e => 122
	i32 489220957, ; 31: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 6
	i32 498788369, ; 32: System.ObjectModel => 0x1dbae811 => 105
	i32 513247710, ; 33: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 42
	i32 538707440, ; 34: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 27
	i32 539058512, ; 35: Microsoft.Extensions.Logging => 0x20216150 => 39
	i32 627609679, ; 36: Xamarin.AndroidX.CustomView => 0x2568904f => 58
	i32 627931235, ; 37: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 38: System.Collections.Concurrent => 0x2814a96c => 79
	i32 683518922, ; 39: System.Net.Security => 0x28bdabca => 100
	i32 690569205, ; 40: System.Xml.Linq.dll => 0x29293ff5 => 120
	i32 722857257, ; 41: System.Runtime.Loader.dll => 0x2b15ed29 => 110
	i32 759454413, ; 42: System.Net.Requests => 0x2d445acd => 99
	i32 775507847, ; 43: System.IO.Compression => 0x2e394f87 => 91
	i32 777317022, ; 44: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 45: Microsoft.Extensions.Options => 0x2f0980eb => 41
	i32 823281589, ; 46: System.Private.Uri.dll => 0x311247b5 => 106
	i32 830298997, ; 47: System.IO.Compression.Brotli => 0x317d5b75 => 90
	i32 869139383, ; 48: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 10
	i32 880668424, ; 49: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 24
	i32 904024072, ; 50: System.ComponentModel.Primitives.dll => 0x35e25008 => 83
	i32 918734561, ; 51: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 21
	i32 961460050, ; 52: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 14
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 61
	i32 990727110, ; 54: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 23
	i32 992768348, ; 55: System.Collections.dll => 0x3b2c715c => 82
	i32 1012816738, ; 56: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 71
	i32 1028951442, ; 57: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 38
	i32 1035644815, ; 58: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 50
	i32 1043950537, ; 59: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 4
	i32 1044663988, ; 60: System.Linq.Expressions.dll => 0x3e444eb4 => 92
	i32 1052210849, ; 61: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 63
	i32 1082857460, ; 62: System.ComponentModel.TypeConverter => 0x408b17f4 => 84
	i32 1084122840, ; 63: Xamarin.Kotlin.StdLib => 0x409e66d8 => 76
	i32 1098259244, ; 64: System => 0x41761b2c => 122
	i32 1108272742, ; 65: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 26
	i32 1117529484, ; 66: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 20
	i32 1118262833, ; 67: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 68: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 69: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 68
	i32 1260983243, ; 70: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 71: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 59
	i32 1308624726, ; 72: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 11
	i32 1324164729, ; 73: System.Linq => 0x4eed2679 => 93
	i32 1336711579, ; 74: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 31
	i32 1373134921, ; 75: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 76: Xamarin.AndroidX.SavedState => 0x52114ed3 => 71
	i32 1404227227, ; 77: LinkPreview => 0x53b2ce9b => 78
	i32 1406073936, ; 78: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 55
	i32 1430672901, ; 79: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1452070440, ; 80: System.Formats.Asn1.dll => 0x568cd628 => 89
	i32 1458022317, ; 81: System.Net.Security.dll => 0x56e7a7ad => 100
	i32 1461004990, ; 82: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 83: System.IO.Compression.dll => 0x57261233 => 91
	i32 1469204771, ; 84: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 51
	i32 1470490898, ; 85: Microsoft.Extensions.Primitives => 0x57a5e912 => 42
	i32 1480492111, ; 86: System.IO.Compression.Brotli.dll => 0x583e844f => 90
	i32 1526286932, ; 87: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 30
	i32 1543031311, ; 88: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 115
	i32 1622152042, ; 89: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 65
	i32 1624863272, ; 90: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 74
	i32 1636350590, ; 91: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 57
	i32 1639515021, ; 92: System.Net.Http.dll => 0x61b9038d => 95
	i32 1639986890, ; 93: System.Text.RegularExpressions => 0x61c036ca => 115
	i32 1657153582, ; 94: System.Runtime => 0x62c6282e => 113
	i32 1658251792, ; 95: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 75
	i32 1677501392, ; 96: System.Net.Primitives.dll => 0x63fca3d0 => 98
	i32 1679769178, ; 97: System.Security.Cryptography => 0x641f3e5a => 114
	i32 1729485958, ; 98: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 53
	i32 1743415430, ; 99: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 100: System.Diagnostics.TraceSource.dll => 0x69239124 => 88
	i32 1766324549, ; 101: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 72
	i32 1770582343, ; 102: Microsoft.Extensions.Logging.dll => 0x6988f147 => 39
	i32 1780572499, ; 103: Mono.Android.Runtime.dll => 0x6a216153 => 126
	i32 1782862114, ; 104: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 105: Xamarin.AndroidX.Fragment => 0x6a96652d => 60
	i32 1793755602, ; 106: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 107: Xamarin.AndroidX.Loader => 0x6bcd3296 => 65
	i32 1813058853, ; 108: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 76
	i32 1813201214, ; 109: Xamarin.Google.Android.Material => 0x6c13413e => 75
	i32 1818569960, ; 110: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 69
	i32 1828688058, ; 111: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 40
	i32 1853025655, ; 112: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 113: System.Linq.Expressions => 0x6ec71a65 => 92
	i32 1875935024, ; 114: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1893218855, ; 115: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 2
	i32 1910275211, ; 116: System.Collections.NonGeneric.dll => 0x71dc7c8b => 80
	i32 1939592360, ; 117: System.Private.Xml.Linq => 0x739bd4a8 => 107
	i32 1953182387, ; 118: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 13
	i32 1968388702, ; 119: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 35
	i32 2003115576, ; 120: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 121: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 63
	i32 2045470958, ; 122: System.Private.Xml => 0x79eb68ee => 108
	i32 2055257422, ; 123: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 62
	i32 2066184531, ; 124: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 125: System.Diagnostics.TraceSource => 0x7b6f419e => 88
	i32 2079903147, ; 126: System.Runtime.dll => 0x7bf8cdab => 113
	i32 2090596640, ; 127: System.Numerics.Vectors => 0x7c9bf920 => 104
	i32 2127167465, ; 128: System.Console => 0x7ec9ffe9 => 86
	i32 2142473426, ; 129: System.Collections.Specialized => 0x7fb38cd2 => 81
	i32 2159891885, ; 130: Microsoft.Maui => 0x80bd55ad => 45
	i32 2169148018, ; 131: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 132: Microsoft.Extensions.Options.dll => 0x820d22b3 => 41
	i32 2192057212, ; 133: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 40
	i32 2193016926, ; 134: System.ObjectModel.dll => 0x82b6c85e => 105
	i32 2201107256, ; 135: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 77
	i32 2201231467, ; 136: System.Net.Http => 0x8334206b => 95
	i32 2207618523, ; 137: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 138: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 36
	i32 2279755925, ; 139: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 70
	i32 2295906218, ; 140: System.Net.Sockets => 0x88d8bfaa => 102
	i32 2303942373, ; 141: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 142: System.Private.CoreLib.dll => 0x896b7878 => 124
	i32 2353062107, ; 143: System.Net.Primitives => 0x8c40e0db => 98
	i32 2366048013, ; 144: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 12
	i32 2368005991, ; 145: System.Xml.ReaderWriter.dll => 0x8d24e767 => 121
	i32 2371007202, ; 146: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 35
	i32 2395872292, ; 147: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2401565422, ; 148: System.Web.HttpUtility => 0x8f24faee => 119
	i32 2427813419, ; 149: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 150: System.Console.dll => 0x912896e5 => 86
	i32 2458678730, ; 151: System.Net.Sockets.dll => 0x928c75ca => 102
	i32 2471841756, ; 152: netstandard.dll => 0x93554fdc => 123
	i32 2475788418, ; 153: Java.Interop.dll => 0x93918882 => 125
	i32 2480646305, ; 154: Microsoft.Maui.Controls => 0x93dba8a1 => 43
	i32 2484371297, ; 155: System.Net.ServicePoint => 0x94147f61 => 101
	i32 2503351294, ; 156: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 16
	i32 2550873716, ; 157: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2576534780, ; 158: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 15
	i32 2593496499, ; 159: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 160: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 77
	i32 2617129537, ; 161: System.Private.Xml.dll => 0x9bfe3a41 => 108
	i32 2620871830, ; 162: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 57
	i32 2626831493, ; 163: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 164: System.Runtime.Loader => 0x9ec4cf01 => 110
	i32 2724373263, ; 165: System.Runtime.Numerics.dll => 0xa262a30f => 111
	i32 2732626843, ; 166: Xamarin.AndroidX.Activity => 0xa2e0939b => 49
	i32 2735172069, ; 167: System.Threading.Channels => 0xa30769e5 => 116
	i32 2737747696, ; 168: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 51
	i32 2740698338, ; 169: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 1
	i32 2752995522, ; 170: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 171: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 44
	i32 2764765095, ; 172: Microsoft.Maui.dll => 0xa4caf7a7 => 45
	i32 2778768386, ; 173: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 73
	i32 2785988530, ; 174: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 175: Microsoft.Maui.Graphics => 0xa7008e0b => 47
	i32 2810250172, ; 176: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 55
	i32 2853208004, ; 177: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 73
	i32 2861189240, ; 178: Microsoft.Maui.Essentials => 0xaa8a4878 => 46
	i32 2909740682, ; 179: System.Private.CoreLib => 0xad6f1e8a => 124
	i32 2916838712, ; 180: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 74
	i32 2919462931, ; 181: System.Numerics.Vectors.dll => 0xae037813 => 104
	i32 2959614098, ; 182: System.ComponentModel.dll => 0xb0682092 => 85
	i32 2978675010, ; 183: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 59
	i32 3038032645, ; 184: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3053864966, ; 185: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 7
	i32 3057625584, ; 186: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 66
	i32 3059408633, ; 187: Mono.Android.Runtime => 0xb65adef9 => 126
	i32 3059793426, ; 188: System.ComponentModel.Primitives => 0xb660be12 => 83
	i32 3103600923, ; 189: System.Formats.Asn1 => 0xb8fd311b => 89
	i32 3178803400, ; 190: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 67
	i32 3220365878, ; 191: System.Threading => 0xbff2e236 => 118
	i32 3249260365, ; 192: RestSharp.dll => 0xc1abc74d => 48
	i32 3258312781, ; 193: Xamarin.AndroidX.CardView => 0xc235e84d => 53
	i32 3305363605, ; 194: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 195: System.Net.Requests.dll => 0xc5b097e4 => 99
	i32 3317135071, ; 196: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 58
	i32 3346324047, ; 197: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 68
	i32 3357674450, ; 198: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 199: Xamarin.AndroidX.Core => 0xc86c06e3 => 56
	i32 3366347497, ; 200: Java.Interop => 0xc8a662e9 => 125
	i32 3374999561, ; 201: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 70
	i32 3381016424, ; 202: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 203: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 37
	i32 3430777524, ; 204: netstandard => 0xcc7d82b4 => 123
	i32 3458724246, ; 205: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 22
	i32 3471940407, ; 206: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 84
	i32 3476120550, ; 207: Mono.Android => 0xcf3163e6 => 127
	i32 3484440000, ; 208: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3509114376, ; 209: System.Xml.Linq => 0xd128d608 => 120
	i32 3580758918, ; 210: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3592228221, ; 211: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 33
	i32 3608519521, ; 212: System.Linq.dll => 0xd715a361 => 93
	i32 3641597786, ; 213: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 62
	i32 3643446276, ; 214: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 215: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 67
	i32 3657292374, ; 216: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 36
	i32 3660523487, ; 217: System.Net.NetworkInformation => 0xda2f27df => 97
	i32 3672681054, ; 218: Mono.Android.dll => 0xdae8aa5e => 127
	i32 3682565725, ; 219: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 52
	i32 3724971120, ; 220: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 66
	i32 3732100267, ; 221: System.Net.NameResolution => 0xde7354ab => 96
	i32 3748608112, ; 222: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 87
	i32 3751619990, ; 223: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 3
	i32 3786282454, ; 224: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 54
	i32 3792276235, ; 225: System.Collections.NonGeneric => 0xe2098b0b => 80
	i32 3802395368, ; 226: System.Collections.Specialized.dll => 0xe2a3f2e8 => 81
	i32 3816437471, ; 227: RestSharp => 0xe37a36df => 48
	i32 3823082795, ; 228: System.Security.Cryptography.dll => 0xe3df9d2b => 114
	i32 3841636137, ; 229: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 38
	i32 3849253459, ; 230: System.Runtime.InteropServices.dll => 0xe56ef253 => 109
	i32 3885497537, ; 231: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 103
	i32 3896106733, ; 232: System.Collections.Concurrent.dll => 0xe839deed => 79
	i32 3896760992, ; 233: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 56
	i32 3920221145, ; 234: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 19
	i32 3928044579, ; 235: System.Xml.ReaderWriter => 0xea213423 => 121
	i32 3931092270, ; 236: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 69
	i32 3944292769, ; 237: LinkPreview.dll => 0xeb1921a1 => 78
	i32 3955647286, ; 238: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 50
	i32 4025784931, ; 239: System.Memory => 0xeff49a63 => 94
	i32 4046471985, ; 240: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 44
	i32 4068434129, ; 241: System.Private.Xml.Linq.dll => 0xf27f60d1 => 107
	i32 4073602200, ; 242: System.Threading.dll => 0xf2ce3c98 => 118
	i32 4091086043, ; 243: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 5
	i32 4094352644, ; 244: Microsoft.Maui.Essentials.dll => 0xf40add04 => 46
	i32 4100113165, ; 245: System.Private.Uri => 0xf462c30d => 106
	i32 4103439459, ; 246: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 29
	i32 4126470640, ; 247: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 37
	i32 4150914736, ; 248: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 249: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 250: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 64
	i32 4213026141, ; 251: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 87
	i32 4249188766, ; 252: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 18
	i32 4271975918, ; 253: Microsoft.Maui.Controls.dll => 0xfea12dee => 43
	i32 4274976490, ; 254: System.Runtime.Numerics => 0xfecef6ea => 111
	i32 4292120959 ; 255: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 64
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [256 x i32] [
	i32 97, ; 0
	i32 96, ; 1
	i32 0, ; 2
	i32 9, ; 3
	i32 117, ; 4
	i32 33, ; 5
	i32 47, ; 6
	i32 17, ; 7
	i32 109, ; 8
	i32 116, ; 9
	i32 32, ; 10
	i32 25, ; 11
	i32 103, ; 12
	i32 54, ; 13
	i32 72, ; 14
	i32 85, ; 15
	i32 52, ; 16
	i32 30, ; 17
	i32 49, ; 18
	i32 8, ; 19
	i32 61, ; 20
	i32 101, ; 21
	i32 117, ; 22
	i32 94, ; 23
	i32 34, ; 24
	i32 28, ; 25
	i32 82, ; 26
	i32 60, ; 27
	i32 119, ; 28
	i32 112, ; 29
	i32 122, ; 30
	i32 6, ; 31
	i32 105, ; 32
	i32 42, ; 33
	i32 27, ; 34
	i32 39, ; 35
	i32 58, ; 36
	i32 19, ; 37
	i32 79, ; 38
	i32 100, ; 39
	i32 120, ; 40
	i32 110, ; 41
	i32 99, ; 42
	i32 91, ; 43
	i32 25, ; 44
	i32 41, ; 45
	i32 106, ; 46
	i32 90, ; 47
	i32 10, ; 48
	i32 24, ; 49
	i32 83, ; 50
	i32 21, ; 51
	i32 14, ; 52
	i32 61, ; 53
	i32 23, ; 54
	i32 82, ; 55
	i32 71, ; 56
	i32 38, ; 57
	i32 50, ; 58
	i32 4, ; 59
	i32 92, ; 60
	i32 63, ; 61
	i32 84, ; 62
	i32 76, ; 63
	i32 122, ; 64
	i32 26, ; 65
	i32 20, ; 66
	i32 16, ; 67
	i32 22, ; 68
	i32 68, ; 69
	i32 2, ; 70
	i32 59, ; 71
	i32 11, ; 72
	i32 93, ; 73
	i32 31, ; 74
	i32 32, ; 75
	i32 71, ; 76
	i32 78, ; 77
	i32 55, ; 78
	i32 0, ; 79
	i32 89, ; 80
	i32 100, ; 81
	i32 6, ; 82
	i32 91, ; 83
	i32 51, ; 84
	i32 42, ; 85
	i32 90, ; 86
	i32 30, ; 87
	i32 115, ; 88
	i32 65, ; 89
	i32 74, ; 90
	i32 57, ; 91
	i32 95, ; 92
	i32 115, ; 93
	i32 113, ; 94
	i32 75, ; 95
	i32 98, ; 96
	i32 114, ; 97
	i32 53, ; 98
	i32 1, ; 99
	i32 88, ; 100
	i32 72, ; 101
	i32 39, ; 102
	i32 126, ; 103
	i32 17, ; 104
	i32 60, ; 105
	i32 9, ; 106
	i32 65, ; 107
	i32 76, ; 108
	i32 75, ; 109
	i32 69, ; 110
	i32 40, ; 111
	i32 26, ; 112
	i32 92, ; 113
	i32 8, ; 114
	i32 2, ; 115
	i32 80, ; 116
	i32 107, ; 117
	i32 13, ; 118
	i32 35, ; 119
	i32 5, ; 120
	i32 63, ; 121
	i32 108, ; 122
	i32 62, ; 123
	i32 4, ; 124
	i32 88, ; 125
	i32 113, ; 126
	i32 104, ; 127
	i32 86, ; 128
	i32 81, ; 129
	i32 45, ; 130
	i32 12, ; 131
	i32 41, ; 132
	i32 40, ; 133
	i32 105, ; 134
	i32 77, ; 135
	i32 95, ; 136
	i32 14, ; 137
	i32 36, ; 138
	i32 70, ; 139
	i32 102, ; 140
	i32 18, ; 141
	i32 124, ; 142
	i32 98, ; 143
	i32 12, ; 144
	i32 121, ; 145
	i32 35, ; 146
	i32 13, ; 147
	i32 119, ; 148
	i32 10, ; 149
	i32 86, ; 150
	i32 102, ; 151
	i32 123, ; 152
	i32 125, ; 153
	i32 43, ; 154
	i32 101, ; 155
	i32 16, ; 156
	i32 11, ; 157
	i32 15, ; 158
	i32 20, ; 159
	i32 77, ; 160
	i32 108, ; 161
	i32 57, ; 162
	i32 15, ; 163
	i32 110, ; 164
	i32 111, ; 165
	i32 49, ; 166
	i32 116, ; 167
	i32 51, ; 168
	i32 1, ; 169
	i32 21, ; 170
	i32 44, ; 171
	i32 45, ; 172
	i32 73, ; 173
	i32 27, ; 174
	i32 47, ; 175
	i32 55, ; 176
	i32 73, ; 177
	i32 46, ; 178
	i32 124, ; 179
	i32 74, ; 180
	i32 104, ; 181
	i32 85, ; 182
	i32 59, ; 183
	i32 34, ; 184
	i32 7, ; 185
	i32 66, ; 186
	i32 126, ; 187
	i32 83, ; 188
	i32 89, ; 189
	i32 67, ; 190
	i32 118, ; 191
	i32 48, ; 192
	i32 53, ; 193
	i32 7, ; 194
	i32 99, ; 195
	i32 58, ; 196
	i32 68, ; 197
	i32 24, ; 198
	i32 56, ; 199
	i32 125, ; 200
	i32 70, ; 201
	i32 3, ; 202
	i32 37, ; 203
	i32 123, ; 204
	i32 22, ; 205
	i32 84, ; 206
	i32 127, ; 207
	i32 23, ; 208
	i32 120, ; 209
	i32 31, ; 210
	i32 33, ; 211
	i32 93, ; 212
	i32 62, ; 213
	i32 28, ; 214
	i32 67, ; 215
	i32 36, ; 216
	i32 97, ; 217
	i32 127, ; 218
	i32 52, ; 219
	i32 66, ; 220
	i32 96, ; 221
	i32 87, ; 222
	i32 3, ; 223
	i32 54, ; 224
	i32 80, ; 225
	i32 81, ; 226
	i32 48, ; 227
	i32 114, ; 228
	i32 38, ; 229
	i32 109, ; 230
	i32 103, ; 231
	i32 79, ; 232
	i32 56, ; 233
	i32 19, ; 234
	i32 121, ; 235
	i32 69, ; 236
	i32 78, ; 237
	i32 50, ; 238
	i32 94, ; 239
	i32 44, ; 240
	i32 107, ; 241
	i32 118, ; 242
	i32 5, ; 243
	i32 46, ; 244
	i32 106, ; 245
	i32 29, ; 246
	i32 37, ; 247
	i32 29, ; 248
	i32 112, ; 249
	i32 64, ; 250
	i32 87, ; 251
	i32 18, ; 252
	i32 43, ; 253
	i32 111, ; 254
	i32 64 ; 255
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
