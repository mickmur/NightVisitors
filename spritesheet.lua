--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ad50aa796b7882f330dba937f608b1bb$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- barn
            x=414,
            y=2,
            width=177,
            height=163,

        },
        {
            -- beam
            x=328,
            y=243,
            width=63,
            height=222,

        },
        {
            -- block
            x=393,
            y=243,
            width=304,
            height=180,

        },
        {
            -- cat
            x=725,
            y=384,
            width=36,
            height=27,

        },
        {
            -- cloud1
            x=414,
            y=171,
            width=127,
            height=68,

        },
        {
            -- cloud2
            x=818,
            y=261,
            width=86,
            height=47,

        },
        {
            -- cloudburst1
            x=822,
            y=145,
            width=102,
            height=114,

        },
        {
            -- cloudburst2
            x=593,
            y=2,
            width=103,
            height=118,

        },
        {
            -- cloudburst3
            x=593,
            y=122,
            width=103,
            height=117,

        },
        {
            -- controls_beam
            x=944,
            y=93,
            width=40,
            height=26,

            sourceX = 11,
            sourceY = 12,
            sourceWidth = 60,
            sourceHeight = 40
        },
        {
            -- controls_beamActive
            x=944,
            y=65,
            width=40,
            height=26,

            sourceX = 11,
            sourceY = 12,
            sourceWidth = 60,
            sourceHeight = 40
        },
        {
            -- controls_landingGear
            x=432,
            y=464,
            width=48,
            height=20,

            sourceX = 7,
            sourceY = 1,
            sourceWidth = 60,
            sourceHeight = 40
        },
        {
            -- controls_landingGearActive
            x=359,
            y=467,
            width=48,
            height=20,

            sourceX = 7,
            sourceY = 2,
            sourceWidth = 60,
            sourceHeight = 40
        },
        {
            -- controls_left
            x=633,
            y=425,
            width=33,
            height=34,

            sourceX = 12,
            sourceY = 3,
            sourceWidth = 65,
            sourceHeight = 40
        },
        {
            -- controls_leftActive
            x=598,
            y=425,
            width=33,
            height=34,

            sourceX = 12,
            sourceY = 3,
            sourceWidth = 65,
            sourceHeight = 40
        },
        {
            -- controls_right
            x=563,
            y=425,
            width=33,
            height=34,

            sourceX = 20,
            sourceY = 3,
            sourceWidth = 65,
            sourceHeight = 40
        },
        {
            -- controls_rightActive
            x=528,
            y=425,
            width=33,
            height=34,

            sourceX = 20,
            sourceY = 3,
            sourceWidth = 65,
            sourceHeight = 40
        },
        {
            -- controls_thrust
            x=799,
            y=384,
            width=34,
            height=52,

            sourceX = 18,
            sourceY = 25,
            sourceWidth = 70,
            sourceHeight = 100
        },
        {
            -- controls_thrustActive
            x=763,
            y=384,
            width=34,
            height=52,

            sourceX = 18,
            sourceY = 25,
            sourceWidth = 70,
            sourceHeight = 100
        },
        {
            -- cow
            x=543,
            y=167,
            width=46,
            height=30,

        },
        {
            -- crow
            x=409,
            y=464,
            width=21,
            height=23,

        },
        {
            -- dog
            x=964,
            y=2,
            width=18,
            height=32,

        },
        {
            -- fence
            x=700,
            y=414,
            width=57,
            height=45,

        },
        {
            -- goat
            x=944,
            y=138,
            width=37,
            height=31,

        },
        {
            -- ground
            x=482,
            y=461,
            width=480,
            height=28,

        },
        {
            -- horse
            x=393,
            y=425,
            width=42,
            height=37,

        },
        {
            -- house
            x=835,
            y=310,
            width=130,
            height=115,

        },
        {
            -- pig
            x=944,
            y=36,
            width=42,
            height=27,

        },
        {
            -- pigeon
            x=328,
            y=467,
            width=29,
            height=21,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 29,
            sourceHeight = 29
        },
        {
            -- pitbull
            x=481,
            y=425,
            width=45,
            height=34,

        },
        {
            -- rabbit
            x=699,
            y=384,
            width=24,
            height=28,

        },
        {
            -- rat
            x=944,
            y=121,
            width=40,
            height=15,

        },
        {
            -- rooster
            x=668,
            y=425,
            width=30,
            height=34,

        },
        {
            -- scarecrow
            x=760,
            y=145,
            width=60,
            height=85,

        },
        {
            -- scarecrow_look
            x=698,
            y=145,
            width=60,
            height=85,

        },
        {
            -- school
            x=700,
            y=2,
            width=242,
            height=141,

        },
        {
            -- sheep
            x=543,
            y=199,
            width=37,
            height=30,

        },
        {
            -- squirrel
            x=437,
            y=425,
            width=42,
            height=36,

            sourceX = 12,
            sourceY = 4,
            sourceWidth = 66,
            sourceHeight = 44
        },
        {
            -- tower
            x=197,
            y=253,
            width=129,
            height=225,

        },
        {
            -- towers_dec
            x=151,
            y=2,
            width=132,
            height=249,

        },
        {
            -- towers_inc
            x=2,
            y=2,
            width=147,
            height=259,

        },
        {
            -- tree1
            x=926,
            y=171,
            width=56,
            height=101,

        },
        {
            -- tree2
            x=2,
            y=263,
            width=193,
            height=226,

        },
        {
            -- tree3
            x=699,
            y=232,
            width=117,
            height=150,

        },
        {
            -- tree4
            x=285,
            y=2,
            width=127,
            height=239,

        },
    },
    
    sheetContentWidth = 988,
    sheetContentHeight = 491
}

SheetInfo.frameIndex =
{

    ["barn"] = 1,
    ["beam"] = 2,
    ["block"] = 3,
    ["cat"] = 4,
    ["cloud1"] = 5,
    ["cloud2"] = 6,
    ["cloudburst1"] = 7,
    ["cloudburst2"] = 8,
    ["cloudburst3"] = 9,
    ["controls_beam"] = 10,
    ["controls_beamActive"] = 11,
    ["controls_landingGear"] = 12,
    ["controls_landingGearActive"] = 13,
    ["controls_left"] = 14,
    ["controls_leftActive"] = 15,
    ["controls_right"] = 16,
    ["controls_rightActive"] = 17,
    ["controls_thrust"] = 18,
    ["controls_thrustActive"] = 19,
    ["cow"] = 20,
    ["crow"] = 21,
    ["dog"] = 22,
    ["fence"] = 23,
    ["goat"] = 24,
    ["ground"] = 25,
    ["horse"] = 26,
    ["house"] = 27,
    ["pig"] = 28,
    ["pigeon"] = 29,
    ["pitbull"] = 30,
    ["rabbit"] = 31,
    ["rat"] = 32,
    ["rooster"] = 33,
    ["scarecrow"] = 34,
    ["scarecrow_look"] = 35,
    ["school"] = 36,
    ["sheep"] = 37,
    ["squirrel"] = 38,
    ["tower"] = 39,
    ["towers_dec"] = 40,
    ["towers_inc"] = 41,
    ["tree1"] = 42,
    ["tree2"] = 43,
    ["tree3"] = 44,
    ["tree4"] = 45,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
