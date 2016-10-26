
local myname, ns = ...


ns.itemdb, ns.bests, ns.allitems = {}, {}, {}


local function ProcessLine(t, value, id, ...)
	if id then
		t[tonumber(id)] = tonumber(value) or 0
		ns.allitems[tonumber(id)] = tonumber(value) or 0
		return ProcessLine(t, value, ...)
	end
end

local function ProcessData(...)
	local t = {}
	for i=1,select("#", ...) do
		local line = select(i, ...)
		if line and line ~= "" then
			ProcessLine(t, string.split(" ", line))
		end
	end
	return t
end

local function DB(name, raw)
	ns.bests[name] = {}
	ns.itemdb[name] = ProcessData(string.split("\n", raw))
end


DB("bandage", [[
120 1251
204 2581
287 3530
539 3531
720 6450
1152 6451
1440 8544
2352 8545
2944 14529
3336 14530
3600 21990
4072 21991
4536 34721
5480 34722
6368 53049
6864 53050
7352 53051
8400 72985
9600 72986
54400 111603
240040 115497
336000 133940
432000 136653
528000 133942
]])

DB("hppot", [[
144 118
198 4596 858
295 929
659 1710
779 18839 3928
1630 11562
1987 13446 28100 31853
2841 22829 32947 33092 33934 39671 43569
1888 39327
3125 34440
3116 40077
3600 33447 41166
2450 57193
6125 57191 63300
12000 76094 76097 89640 113585
68000 117415 109226 109223 136569 129196 140351 127834
255000 115498
456000 127836
]])

DB("mppot", [[
288 2455
692 3385
1160 3827
1715 6149
2450 57193
2556 13444 28101 31855
2775 13443 18841
3000 76094 89641 113585
3116 40077
3125 34440
3408 22832 32948 33093 33935 40067 43570
4061 33448 42545
4900 57192
6000 76098
17000 109226 127836
22667 127835
34000 109222 140347
]])

DB("water", [[
324 159 60269
529 2682
907 1179 17404 49365 49601 63530 90659
1252 1205 19299 90660 9451
2160 10841 1708 17405 4791 61382
3510 1645 19300 63023
4704 33445 41731 42777 43236 58274 59229
5514 23161
5580 23585 38429 8766
9018 19301
9120 24006
9720 18300 24007 32455
9888 13724
7248 28399 29454 32722 38430
10230 27860 29395 29401 30457 32453 32668 33042 33053 34780 35954 37253 38431 40357 44750
11028 58256 59029 59230
12126 33444 38698 43086
15000 75037 75038
18138 34759 34760 34761 39520
20000 75026 81924 85501 86026 104196 140340
23520 58257 62672 62675 63251 68140
30000 74636 81923 88532 88578 112449
36276 45932
170000 117452 111455 111544 117475
175000 133586
600000 138983
700000 128853 138975 139346 140203 140628 141527
1200000 139398 133575 139347 140204 140265 140266 140269 140272 140298 141215 128850 138292 138982 140629
]])

DB("food", [[
147 11109 6299
162 117 16166 17344 19223 2070 20857 23495 2679 2681 30816 4536 4540 4604 4656 5057 60267 60268 60375 60377 60378 60379 6290 7097 787 961 140337
454 12238 16167 17119 17406 18633 19304 2287 24072 414 4537 4541 4592 4605 49600 5066 5095 62909 6316 6316 67230 6890 112095
529 2682 5473
845 16170 19305 2685 3770 422 4538 4542 4593 4606 5478 5526 57518 63693 65730 65731 7228 733 140753 140754
2500 13755 16169 1707 17407 18632 19224 3771 4539 4544 4594 4607 61383 63692 6807 8364
2904 13546 13893 13930 16168 16766 17408 18255 18635 19306 21030 21552 3927 4599 4601 4602 4608 63691 6887
4494 23160
4884 13724
6138 32722
5244 11415 11444 13933 13935 19225 21031 21033 22324 24338 67270 67271 67272 67273 8932 8948 8950 8952 8953 8957 140339
10650 29394 29448 29449 29450 29451 29452 29453 30355 32685 32686 33048 33053 34780 38428
15336 41751 24408 27661 27854 27855 27856 27857 27858 27859 28486 29393 29412 30458 30610 38427 140344
15660 19301
16536 58258 58260 58262 58264 58266 58268 59228 59232 62676
17454 33443 33449 33451 33452 33454 35949 37252 40356 40358 40359 42428 42430 42432 42433 44608 44609 44749
20000 75026 81175 81889 81917 81919 81922 82448 82450 83097 85504 86026 86057 86508 104196
21252 34747 34759 34760 34761 35947 35948 35950 35951 35952 35953 38706 40202 41729 42429 42431 42434 42778 43087 44049 44071 44072 44607 44722 58275 58276 58277 58278 58279 58280 59227 59231 140341
23520 58259 58261 58263 58265 58267 58269 62677
30000 74641 81916 81918 81920 81921 82449 82451 88398 90135 75038 112449
42504 45932
170000 111456 111544 115351 115352 115353 115354 115355 117454 117457 117469 117470 117471 117472 117473 117474 118050 118051 113290 113099 130259 128761
700000 140626 128836 128837 128839 128843 128845 128848 136556 138285 138976 138977 138979 138980 138987 139344 140201 140202 140276 128763 140668 128849
1200000 132752 132753 136544 136545 136546 136547 136548 136549 136550 136551 136552 136553 136554 136555 136557 136558 136559 136560 140273 140275 138972 138973 138974 133893 133981 133979 133893 140184 140205 140206 140207 128764 128835 140286 140296 140297 140299 140300 140301 140302 140627 128838 140631 140679 141206 141207 141208 141212 141213 141214 128840 128844 128846 128847 128851 138290 138291 138978 139345
2400000 133575 138983 138986 139398 140355
]])

DB("percfood", [[
50 19696 19994 19995 19996 21235
75 20388 20389 20390
100 21215 21537 123859
999 65500 65515 65516 65517 43518 43523 65499 80610 113509
]])

DB("percwater", [[
60 19997 21241
75 20388 20389 20390 21537
100 21215 133980 123859
999 65500 65515 65516 65517 43518 43523 65499 80610 113509
]])
