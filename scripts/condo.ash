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

boolean set_condo(int f0, int f1, int f2, int f3)
{
    int[int] all_furn = {0:f0, 1:f1, 2:f2, 3:f3};
    boolean failure = false;
    print("Setting condo to:");
    foreach i,f_id in all_furn {
        boolean do_not_have = !have_furniture(f_id);
        if (do_not_have) {
            rprint("  "+FURNITURE[f_id]+" [DO NOT HAVE]");
            failure = true;
        }
        else {
            print("  "+FURNITURE[f_id]);
        }
    }
    if (failure) { return false; }
    visit_url("inv_use.php?whichitem="+to_int($item[Leprecondo]));
    string url = `choice.php?whichchoice=1556&option=1&r0={f0}&r1={f1}&r2={f2}&r3={f3}&pwd`;
    visit_url(url);
    return get_property("leprecondoInstalled")==`{f0},{f1},{f2},{f3}`;
}

boolean set_condo(string f0, string f1, string f2, string f3)
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

    return set_condo(f_id0,f_id1,f_id2,f_id3);
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
    
    boolean success = set_condo(input[0],input[1],input[2],input[3]);
    if (!success) {
        rprint("Failed to set condo");
    }
    
    return;
}
