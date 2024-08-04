module lut_example (
    input logic [9:0] address,
    output logic [15:0] sine_2,
    output logic [15:0] sine_30,
    output logic [15:0] noisy 
);

// LUT 2MHz sine
logic [15:0] lut_2 [0:499] ='{
    7500,7688,7877,8066,8254,8441,8628,8815,9000,9185,9368,9551,9732,9911,10089,10266,10440,10613,10784,10953,
11119,11284,11445,11605,11761,11916,12067,12215,12360,12503,12642,12778,12910,13039,13165,13287,13405,13520,13630,13737,
13840,13939,14034,14124,14211,14293,14371,14444,14513,14578,14638,14694,14745,14791,14833,14871,14903,14931,14954,14972,
14986,14995,14999,14999,14993,14983,14968,14949,14924,14895,14862,14823,14780,14733,14680,14624,14562,14497,14426,14352,
14273,14190,14102,14010,13915,13815,13711,13603,13491,13376,13257,13134,13007,12877,12744,12607,12467,12324,12178,12029,
11877,11723,11565,11405,11243,11078,10911,10741,10570,10397,10222,10045,9866,9687,9505,9323,9139,8954,8768,8582,
8395,8207,8018,7830,7641,7452,7263,7075,6886,6698,6511,6324,6138,5952,5768,5585,5403,5222,5043,4865,
4689,4515,4343,4173,4004,3838,3675,3514,3355,3199,3045,2895,2747,2603,2461,2323,2188,2056,1928,1803,
1682,1565,1451,1342,1236,1134,1036,942,853,767,686,609,537,469,405,346,292,242,197,156,
120,89,62,40,23,10,3,0,1,8,19,35,56,81,112,147,186,230,279,332,
390,453,520,591,667,747,831,919,1012,1109,1210,1315,1424,1536,1653,1773,1897,2024,2155,2289,
2426,2567,2711,2858,3007,3160,3316,3474,3634,3797,3963,4130,4300,4472,4646,4821,4999,5177,5358,5539,
5722,5906,6091,6277,6464,6651,6839,7028,7216,7405,7594,7783,7971,8160,8348,8535,8722,8908,9093,9277,
9460,9641,9822,10000,10178,10353,10527,10699,10869,11036,11202,11365,11525,11683,11839,11992,12141,12288,12432,12573,
12710,12844,12975,13102,13226,13346,13463,13575,13684,13789,13890,13987,14080,14168,14252,14332,14408,14479,14546,14609,
14667,14720,14769,14813,14852,14887,14918,14943,14964,14980,14991,14998,14999,14996,14989,14976,14959,14937,14910,14879,
14843,14802,14757,14707,14653,14594,14530,14462,14390,14313,14232,14146,14057,13963,13865,13763,13657,13548,13434,13317,
13196,13071,12943,12811,12676,12538,12396,12252,12104,11954,11800,11644,11485,11324,11161,10995,10826,10656,10484,10310,
10134,9956,9777,9596,9414,9231,9047,8861,8675,8488,8301,8113,7924,7736,7547,7358,7169,6981,6792,6604,
6417,6231,6045,5860,5676,5494,5312,5133,4954,4777,4602,4429,4258,4088,3921,3756,3594,3434,3276,3122,
2970,2821,2675,2532,2392,2255,2122,1992,1865,1742,1623,1508,1396,1288,1184,1084,989,897,809,726,
647,573,502,437,375,319,266,219,176,137,104,75,50,31,16,6,0,0,4,13,
27,45,68,96,128,166,208,254,305,361,421,486,555,628,706,788,875,965,1060,1159,
1262,1369,1479,1594,1712,1834,1960,2089,2221,2357,2496,2639,2784,2932,3083,3238,3394,3554,3715,3880,
4046,4215,4386,4559,4733,4910,5088,5267,5448,5631,5814,5999,6184,6371,6558,6745,6933,7122,7311,7499
};

// LUT 30MHz sine
logic [15:0] lut_30 [0:499] ='{
    7500,10266,12642,14293,14986,14624,13257,11078,8395,5585,3045,1134,120,147,1210,3160,5722,8535,11202,13346,
14667,14976,14232,12538,10134,7358,4602,2255,647,6,421,1834,4046,6745,9551,12067,13939,14903,14823,13711,
11723,9139,6324,3675,1565,292,35,831,2567,4999,7783,10527,12844,14408,14998,14530,13071,10826,8113,5312,
2821,989,75,208,1369,3394,5999,8815,11445,13520,14745,14949,14102,12324,9866,7075,4343,2056,537,0,
520,2024,4300,7028,9822,12288,14080,14943,14757,13548,11485,8861,6045,3434,1396,219,68,965,2784,5267,
8066,10784,13039,14513,14999,14426,12877,10570,7830,5043,2603,853,40,279,1536,3634,6277,9093,11683,13684,
14813,14910,13963,12104,9596,6792,4088,1865,437,4,628,2221,4559,7311,10089,12503,14211,14972,14680,13376,
11243,8582,5768,3199,1236,156,112,1109,3007,5539,8348,11036,13226,14609,14989,14313,12676,10310,7547,4777,
2392,726,16,361,1712,3880,6558,9368,11916,13840,14871,14862,13815,11877,9323,6511,3838,1682,346,19,
747,2426,4821,7594,10353,12710,14332,14991,14594,13196,10995,8301,5494,2970,1084,104,166,1262,3238,5814,
8628,11284,13405,14694,14968,14190,12467,10045,7263,4515,2188,609,3,453,1897,4130,6839,9641,12141,13987,
14918,14802,13657,11644,9047,6231,3594,1508,266,45,875,2639,5088,7877,10613,12910,14444,14999,14497,13007,
10741,8018,5222,2747,942,62,230,1424,3474,6091,8908,11525,13575,14769,14937,14057,12252,9777,6981,4258,
1992,502,0,555,2089,4386,7122,9911,12360,14124,14954,14733,13491,11405,8768,5952,3355,1342,197,81,
1012,2858,5358,8160,10869,13102,14546,14996,14390,12811,10484,7736,4954,2532,809,31,305,1594,3715,6371,
9185,11761,13737,14833,14895,13915,12029,9505,6698,4004,1803,405,8,667,2289,4646,7405,10178,12573,14252,
14980,14653,13317,11161,8488,5676,3122,1184,137,128,1159,3083,5631,8441,11119,13287,14638,14983,14273,12607,
10222,7452,4689,2323,686,10,390,1773,3963,6651,9460,11992,13890,14887,14843,13763,11800,9231,6417,3756,
1623,319,27,788,2496,4910,7688,10440,12778,14371,14995,14562,13134,10911,8207,5403,2895,1036,89,186,
1315,3316,5906,8722,11365,13463,14720,14959,14146,12396,9956,7169,4429,2122,573,0,486,1960,4215,6933,
9732,12215,14034,14931,14780,13603,11565,8954,6138,3514,1451,242,56,919,2711,5177,7971,10699,12975,14479,
14999,14462,12943,10656,7924,5133,2675,897,50,254,1479,3554,6184,9000,11605,13630,14791,14924,14010,12178,
9687,6886,4173,1928,469,1,591,2155,4472,7216,10000,12432,14168,14964,14707,13434,11324,8675,5860,3276,
1288,176,96,1060,2932,5448,8254,10953,13165,14578,14993,14352,12744,10397,7641,4865,2461,767,23,332,
1653,3797,6464,9277,11839,13789,14852,14879,13865,11954,9414,6604,3921,1742,375,13,706,2357,4733,7499
};

// LUT NOISY=2+30 MHz
logic [15:0] lut_noisy [0:499] ='{
    7500,8977,10259,11179,11620,11532,10943,9946,8697,7385,6207,5342,4926,5029,5650,6713,8081,9574,10993,12150,
12893,13130,12839,12071,10948,9637,8334,7235,6504,6254,6531,7306,8478,9892,11358,12677,13672,14211,14227,13724,
12781,11539,10179,8900,7888,7292,7203,7638,8540,9788,11210,12610,13795,14600,14915,14700,13987,12879,11533,10142,
8903,7992,7537,7603,8181,9189,10483,11882,13185,14207,14803,14886,14441,13529,12273,10849,9453,8276,7482,7176,
7396,8107,9201,10519,11868,13051,13895,14273,14124,13462,12371,10997,9526,8156,7070,6413,6268,6645,7481,8648,
9971,11253,12302,12959,13121,12752,11894,10656,9200,7720,6412,5449,4953,4983,5521,6478,7708,9023,10226,11133,
11604,11559,10991,9967,8619,7122,5676,4470,3662,3351,3570,4273,5348,6632,7929,9044,9807,10097,9862,9121,
7966,6548,5056,3686,2620,1997,1893,2311,3181,4369,5697,6966,7987,8606,8725,8318,7432,6183,4737,3290,
2037,1146,734,851,1474,2507,3797,5155,6384,7304,7778,7736,7176,6173,4864,3429,2065,962,272,88,
433,1257,2442,3817,5188,6360,7167,7495,7297,6602,5507,4168,2775,1526,598,125,176,746,1758,3073,
4509,5868,6962,7642,7817,7468,6649,5482,4138,2812,1699,962,713,994,1775,2952,4368,5833,7148,8138,
8672,8685,8184,7251,6027,4695,3455,2491,1950,1921,2419,3384,4694,6175,7629,8866,9721,10088,9927,9273,
8232,6962,5657,4512,3703,3357,3535,4226,5345,6748,8251,9654,10773,11464,11642,11296,10487,9342,8037,6767,
5726,5072,4911,5278,6133,7370,8824,10305,11615,12580,13078,13049,12508,11544,10304,8972,7748,6815,6314,6327,
6861,7851,9166,10631,12047,13224,14005,14286,14037,13300,12187,10861,9517,8350,7531,7182,7357,8037,9131,10490,
11926,13241,14253,14823,14874,14401,13473,12224,10831,9492,8397,7702,7504,7832,8639,9811,11182,12557,13742,14566,
14911,14727,14037,12934,11570,10135,8826,7823,7263,7221,7695,8615,9844,11202,12492,13525,14148,14265,13853,12962,
11709,10262,8816,7567,6681,6274,6393,7012,8033,9302,10630,11818,12688,13106,13002,12379,11313,9943,8451,7033,
5878,5137,4902,5192,5955,7070,8367,9651,10726,11429,11648,11337,10529,9323,7877,6380,5032,4008,3440,3395,
3866,4773,5976,7291,8521,9478,10016,10046,9550,8587,7279,5799,4343,3105,2247,1878,2040,2697,3746,5028,
6351,7518,8354,8731,8586,7929,6843,5473,4002,2628,1537,875,726,1104,1948,3131,4480,5798,6892,7603,
7823,7517,6723,5546,4150,2726,1470,558,113,196,792,1814,3117,4516,5810,6818,7396,7462,7007,6096,
4857,3466,2120,1012,299,84,399,1204,2389,3789,5211,6459,7361,7796,7707,7111,6099,4820,3460,2218,
1275,772,788,1327,2322,3641,5107,6521,7693,8468,8745,8495,7764,6665,5362,4051,2928,2160,1869,2106,
2849,4006,5425,6918,8286,9349,9970,10073,9657,8792,7614,6302,5053,4056,3467,3379,3820,4740,6022,7499


};
    // Output data based on the address
    always_comb begin
      sine_2=lut_2[address];
      sine_30=lut_30[address];
      noisy=lut_noisy[address];
    end

endmodule
