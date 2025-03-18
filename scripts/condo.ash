since r28448; // crafting plans

static int CONDO_CHOICE_ID = 1556;
static int BAD_FURNITURE = -1;

static string[int] FURNITURE = {
     1: "buckets of concrete",
     2: "thrift store oil painting",
     3: "boxes of old comic books",
     4: "second-hand hot plate",
     5: "beer cooler",
     6: "free mattress",
     7: "gigantic chess set",
     8: "UltraDance karaoke machine",
     9: "cupcake treadmill",
    10: "beer pong table",
    11: "padded weight bench",
    12: "internet connected laptop",
    13: "sous vide laboratory",
    14: "programmable blender",
    15: "sensory deprivation tank",
    16: "fruit-smashing robot",
    17: "ManCave&trade; sports bar set",
    18: "couch and flatscreen",
    19: "kegerator",
    20: "fine upholstered dining table set",
    21: "whiskeybed",
    22: "high-end home workout system",
    23: "complete classics library",
    24: "ultimate retro game console",
    25: "Omnipot",
    26: "fully-stocked wet bar",
    27: "four-posted bed",
    BAD_FURNITURE: "BAD FURNITURE"
};

static location[int] FURNITURE_LOCATION = {
     1: $location[none]                                                , // buckets of concrete
     2: $location[none]                                                , // thrift store oil painting
     3: $location[none]                                                , // boxes of old comic books
     4: $location[none]                                                , // second-hand hot plate
     5: $location[none]                                                , // beer cooler
     6: $location[none]                                                , // free mattress
     7: $location[An Octopus's Garden]                                 , // gigantic chess set
     8: $location[Infernal Rackets Backstage]                          , // UltraDance karaoke machine
     9: $location[Madness Bakery]                                      , // cupcake treadmill
    10: $location[Frat House]                                          , // beer pong table
    11: $location[The Degrassi Knoll Garage]                           , // padded weight bench
    12: $location[The Hidden Office Building]                          , // internet connected laptop
    13: $location[The Haunted Kitchen]                                 , // sous vide laboratory
    14: $location[Cobb's Knob Kitchens]                                , // programmable blender
    15: $location[The Marinara Trench]                                 , // sensory deprivation tank
    16: $location[Wartime Hippy Camp]                                  , // fruit-smashing robot
    17: $location[A Barroom Brawl]                                     , // ManCave&trade; sports bar set
    18: $location[Frat House]                                          , // couch and flatscreen
    19: $location[The Orcish Frat House (Bombed Back to the Stone Age)], // kegerator
    20: $location[The Hidden Apartment Building]                       , // fine upholstered dining table set
    21: $location[The Castle in the Clouds in the Sky (Ground Floor)]  , // whiskeybed
    22: $location[The Degrassi Knoll Gym]                              , // high-end home workout system
    23: $location[The Haunted Library]                                 , // complete classics library
    24: $location[Megalo-City]                                         , // ultimate retro game console
    25: $location[Cobb's Knob Laboratory]                              , // Omnipot
    26: $location[The Purple Light District]                           , // fully-stocked wet bar
    27: $location[Dreadsylvanian Castle]                               , // four-posted bed
    BAD_FURNITURE: $location[none]
};

static int NEED_EXER   = 1;
static int NEED_SMART  = 2;
static int NEED_DUMB   = 3;
static int NEED_FOOD   = 4;
static int NEED_BOOZE  = 5;
static int NEED_SLEEP  = 6;

static string[int][int] FURNITURE_RESULT = {
     0: {}, // unset value
     1: { NEED_EXER : $effect[Gym Bros]           },
     2: { NEED_SMART: $effect[Well Stimulated]    },
     3: { NEED_DUMB : $effect[Wasting Time]       },
     4: { NEED_FOOD : "Decent food"               },
     5: { NEED_BOOZE: "Beer"                      },
     6: { NEED_SLEEP: $effect[Good Night's Sleep] },
     7: { NEED_EXER : $effect[Work out Smarter, Not Harder], NEED_SMART: $effect[Well Stimulated]        },
     8: { NEED_EXER : $effect[Vicarious Sweat]             , NEED_DUMB : $effect[Your Days Are Numbed]   },
     9: { NEED_EXER : $effect[Your Days Are Numbed]        , NEED_FOOD : $item[standard-issue cupcake]   },
    10: { NEED_EXER : $item[Table Tennis Ball]             , NEED_BOOZE: "Beer"                          },
    11: { NEED_EXER : $effect[Gym Bros]                    , NEED_SLEEP: $effect[Tired Muscles]          },
    12: { NEED_SMART: $item[crafting plans]                , NEED_DUMB : $effect[Wasting Time]           },
    13: { NEED_SMART: $effect[Counter Intelligence]        , NEED_FOOD : "Good food"                     },
    14: { NEED_SMART: $effect[Counter Intelligence]        , NEED_BOOZE: "Good booze"                    },
    15: { NEED_SMART: $effect[Alone with Your Thoughts]    , NEED_SLEEP: $effect[Quiet Night's Sleep]    },
    16: { NEED_DUMB : $effect[You Might Have Gotten Wet]   , NEED_FOOD : "Fruit"                         },
    17: { NEED_DUMB : $item[bar dart]                      , NEED_BOOZE: "SHOTS SHOTS SHOTS"             },
    18: { NEED_DUMB : $effect[Your Days Are Numbed]        , NEED_SLEEP: $effect[Good Night's Sleep]     },
    19: { NEED_FOOD : "Decent food"                        , NEED_BOOZE: $item[pint of Leprechaun Stout] },
    20: { NEED_FOOD : "Good food"                          , NEED_SLEEP: $effect[Sur La Table]           },
    21: { NEED_BOOZE: "Decent booze"                       , NEED_SLEEP: $effect[Moist Night's Sleep]    },
    22: { NEED_EXER : $item[scoop of pre-workout powder]    },
    23: { NEED_SMART: $item[leprechaun antidepressant pill] },
    24: { NEED_DUMB : $item[phosphor traces]                },
    25: { NEED_FOOD : "Excellent food"                      },
    26: { NEED_BOOZE: "Excellent booze"                     },
    27: { NEED_SLEEP: $effect[Spacious Night's Sleep]       },
    BAD_FURNITURE: {}
};

string need_to_string(int need)
{
    switch (need) {
        case NEED_EXER  : return "Exercise";
        case NEED_SMART : return "Mental Stimulation";
        case NEED_DUMB  : return "Dumb Entertainment";
        case NEED_FOOD  : return "Food";
        case NEED_BOOZE : return "Booze";
        case NEED_SLEEP : return "Sleep";
    }
    return "BAD NEED";
}

void rprint(string s) {print(s,"red");}

string strip(string input)
{
	matcher whitespace = create_matcher("(\\A\\s+)|(\\s+\\z)", input);
	return replace_all(whitespace, "");
}

int substring_match_furniture(string match)
{
    int[int] matches;
    foreach id,fname in FURNITURE {
        string prep_match = strip(match.to_lower_case());
        if (contains_text(fname.to_lower_case(),prep_match)) {
            matches[count(matches)] = id;
        }
    }
    if (count(matches)==0) {
        rprint("Did not match furniture for pattern: "+match);
        return BAD_FURNITURE;
    }
    if (count(matches)>1)
    {
        rprint("Returned multiple matches for pattern: "+match);
        foreach id in matches {
            rprint("  "+FURNITURE[id]);
        }
        return BAD_FURNITURE;
    }
    return matches[0];
}

boolean have_condo()
{
    if (available_amount($item[leprecondo])==0) { return false; }
    return is_unrestricted($item[leprecondo]);
}

boolean have_furniture(int f_id)
{
    foreach i,id_string in split_string(get_property("leprecondoDiscovered"),",") {
        if (id_string.to_int()==f_id) { return true; }
    }
    return false;
}

boolean print_and_check_config(int[int] all_furn)
{
    boolean failure = false;
    buffer out_html = to_buffer("New config:<br />");
    foreach i,f_id in all_furn {
        boolean do_not_have = !have_furniture(f_id);
        if (do_not_have) {
            out_html.append("<span style=color:red>&nbsp;&nbsp;&nbsp;&nbsp;"+FURNITURE[f_id]+" [DO NOT HAVE]</span><br />");
            failure = true;
        }
        else {
            out_html.append("<span>&nbsp;&nbsp;&nbsp;&nbsp;"+FURNITURE[f_id]+"</span><br />");
        }
    }
    print_html(out_html);
    return !failure;
}

boolean set_condo(int f0, int f1, int f2, int f3, boolean sim)
{
    int[int] all_furn = {0:f0, 1:f1, 2:f2, 3:f3};
    boolean failure = false;
    if (!print_and_check_config(all_furn)) { return false; }
    if (sim) { return true; }
    if (get_property("leprecondoInstalled")==`{f0},{f1},{f2},{f3}`) {
        print("Condo is already set to that. Not wasting time doing it again.");
    }
    else {
        visit_url("inv_use.php?whichitem="+to_int($item[Leprecondo]));
        string url = `choice.php?whichchoice=1556&option=1&r0={f0}&r1={f1}&r2={f2}&r3={f3}&pwd`;
        visit_url(url);
    }
    return get_property("leprecondoInstalled")==`{f0},{f1},{f2},{f3}`;
}

// As above with default to not sim
boolean set_condo(int f0, int f1, int f2, int f3)
{
    return set_condo(f0, f1, f2, f3, false);
}

boolean set_condo(string f0_name, string f1_name, string f2_name, string f3_name, boolean sim)
{
    boolean failure = false;
    int f_id0 = substring_match_furniture(f0_name);
    int f_id1 = substring_match_furniture(f1_name);
    int f_id2 = substring_match_furniture(f2_name);
    int f_id3 = substring_match_furniture(f3_name);
    if ( f_id0 == BAD_FURNITURE ||
         f_id1 == BAD_FURNITURE ||
         f_id1 == BAD_FURNITURE ||
         f_id1 == BAD_FURNITURE) return false;

    return set_condo(f_id0,f_id1,f_id2,f_id3, sim);
}

// As above with default to not sim
boolean set_condo(string f0_name, string f1_name, string f2_name, string f3_name)
{
    return set_condo(f0_name, f1_name, f2_name, f3_name, false);
}

boolean print_results(int f0, int f1, int f2, int f3)
{
    string[int] results;
    string[int] sources;
    for (int need = 1 ; need <= 6 ; need++) {
        results[need] = "UNUSED";
        sources[need] = "NONE";
    }
    foreach need,res in FURNITURE_RESULT[f0] { results[need] = res; sources[need] = FURNITURE[f0];}
    foreach need,res in FURNITURE_RESULT[f1] { results[need] = res; sources[need] = FURNITURE[f1];}
    foreach need,res in FURNITURE_RESULT[f2] { results[need] = res; sources[need] = FURNITURE[f2];}
    foreach need,res in FURNITURE_RESULT[f3] { results[need] = res; sources[need] = FURNITURE[f3];}
    
    buffer out_html = to_buffer("<table border=\"1\">");
    for (int need = 1 ; need <= 6 ; need++) {
        out_html.append("<tr><td>"+need_to_string(need)+"</td><td>"+results[need]+"</td><td>"+sources[need]+"</td></tr>");
    }
    out_html.append("</table>");
    print_html(out_html);
    return true;
}
        
boolean print_results(string f0, string f1, string f2, string f3)
{
    boolean failure = false;
    int f_id0 = substring_match_furniture(f0);
    int f_id1 = substring_match_furniture(f1);
    int f_id2 = substring_match_furniture(f2);
    int f_id3 = substring_match_furniture(f3);
    if ( f_id0 == BAD_FURNITURE ||
         f_id1 == BAD_FURNITURE ||
         f_id1 == BAD_FURNITURE ||
         f_id1 == BAD_FURNITURE) return false;

    return print_results(f_id0,f_id1,f_id2,f_id3);
}

boolean print_results()
{
    string[int] f = split_string(get_property("leprecondoInstalled"),",");
    print_results(f[0].to_int(),f[1].to_int(),f[2].to_int(),f[3].to_int());
    return true;
}

void print_discovered()
{
    print("Furniture discovered: ");
    for (int i = 1 ; i <= 27 ; i++) {
        if (have_furniture(i)) { print_html("&nbsp;&nbsp;"+FURNITURE[i]); }
    }
    return;
}

void print_todo()
{
    print("Furniture left to find: ");
    buffer out_html = to_buffer("<table border=\"1\">");
    for (int i = 1 ; i <= 27 ; i++) {
        if (!have_furniture(i)) { out_html.append("<tr><td>"+FURNITURE[i]+"</td><td>"+FURNITURE_LOCATION[i]+"</td></tr>"); }
    }
    out_html.append("</table>");
    print_html(out_html);
    return;
}

void print_help()
{
    buffer out_html;
    out_html.append("condo run options: ");
    out_html.append("<br /> &nbsp;&nbsp;&nbsp;&nbsp;condo - print current configuration");
    out_html.append("<br /> &nbsp;&nbsp;&nbsp;&nbsp;condo [sim] furn1,furn2,furn3,furn4 - set and print new configuration. With sim, print only.");
    out_html.append("<br /> &nbsp;&nbsp;&nbsp;&nbsp;condo discovered - print discovered furniture.");
    out_html.append("<br /> &nbsp;&nbsp;&nbsp;&nbsp;condo todo - print furniture left to find and locations.");
    out_html.append("<br /> &nbsp;&nbsp;&nbsp;&nbsp;condo help - print this message.");
    print_html(out_html);
}

void main(string... raw_input)
{
    if (!have_condo())
    {
        rprint("No leprecondo found.");
        return;
    }
    
    if (count(raw_input) == 0)
    {
        print("Current condo setup:");
        foreach i,id_string in split_string(get_property("leprecondoInstalled"),",") {
            print_html("&nbsp;&nbsp;"+FURNITURE[id_string.to_int()]);
        }
        print_results();
        return;
    }
    if (raw_input[0]=="help") {
        print_help();
        return;
    }
    if (raw_input[0]=="discovered") {
        print_discovered();
        return;
    }
    if (raw_input[0]=="todo") {
        print_todo();
        return;
    }
    
    string[int] input = split_string(raw_input[0],",");
    
    if (count(input) != 4)
    {
        rprint("Need four furniture items, separated by commas.");
        return;
    }
    
    // Check if we're simulating
    if (substring(input[0],0,4).to_lower_case()=="sim ")
    {
        input[0] = substring(input[0],4);
        set_condo(input[0],input[1],input[2],input[3],true);
        print("Simulated results:");
        print_results(input[0],input[1],input[2],input[3]);
        return;
    }
    
    boolean success = set_condo(input[0],input[1],input[2],input[3]);
    if (!success) {
        rprint("Failed to set condo");
    }
    
    print("Current results:");
    print_results();
    
    return;
}
