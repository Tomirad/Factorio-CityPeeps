# CityPeeps
CityPeeps is a civilization simulation designed to extend end game by providing two exits for resources.  

## Art usage and other mod assets
*  I would like to thank TheSAGuy for granting permission to use some of the art from Bio Industry - especially the Bio Farm which I love.  
*  A few of the icon assets were used from Icon8 site:  https://icons8.com/

## Buildings 
The mod includes construction of the following "building" entities:
*  City - A logistic requester chest that requires crates of goods to generate households which consume the crates.  
    - Cities also produce students when supplied with their needs.
    - Cities cannot currently be moved (mined) once placed - and is the only building with such a restriction.
    - Cities cannot currently be placed within certain tiles of each other - setting based.
*  TradeHub - Delivers export crates to the galaxy which will increase your galactic renown.
*  DataCenter - An assembler where you can manufacture datacrons for export to increase renown.
*  Academy - An assembler which trains students for a small chance at becoming officers (productivity modules) and increase rank of lower officers to higher officers.
*  Resort - A logistic requester chest where you can drop off students from cities for credits and renown.
    - Resorts also have a tile distance restriction with any city - setting based.  

## Peeps (People)
There are also the following "peep" items:
*  Student - a peep that can be 'trained' in an academy for a fairly low set of chances at becoming one of the ranked officers.
    - A custom 'passenger wagon' with 8 pre-filtered student slots has been added for transporting them in  style!
    - I haven't figured out a good way to keep players from hauling peeps in regular cargo wagons (grr).  
    - Students are generated at 1 per every 2 households each update cycle.
*  Officer 1 - a 5% productivity module.
*  Officer 2 - a 10% productivity module.
*  Officer 3 - a 20% productivity module.

## Production Chain
*  CityPeeps has its own item-groups, items, and recipes.
*  The categories are all custom and grouped by the machine that makes each thing.
*  Each item/recipe is intended to be unique to eliminate any conflicts with other mods.

## How it works
At default update interval setting, the following update cycle will occur each Factorio day. (A Factorio day is 7 minutes and the days are tracked in the GUI):
*  The tradehub will scan for and remove export chests and datacrons - this increases export count which translates to score.
*  Each city will scan for a set of configurable needs.  
    - If the needs are met, 100 households will join the city and grow until the city is at max capacity.
    - Every 100 households will consume one of each of the "needs" crates each cycle.
    - Households will leave at 100 per update if needs are not met.  
    - For every 200 households, a student peep will be generated - you can either train them at an academy or send them to a resort for credits.
*  The resort will remove any students in its inventory and increase credit total accordingly.
*  Score translates to a tier of title and renown labels.
    - Every 10 exports equals one score point. 
    - Every distrct (100 households) equals one score point. 
    - Every passenger delivered equals one point.
*  If a new tier is reached, a reward may be granted and message displayed.

## Mod Settings and Configure.lua
*  There are mod settings that can be used to configure various things.  
*  There is a confiure.lua file that can be modified for renown tiers and city needs as well.  
*  Tiers can currently grant rewards of two types to the player - items and recipies.  
*  The recipes to train officers from rank 1 to 2 and 3 can only be gained by increasing score to certain tiers.  
*  Creation of datacrons at the datacenter can only be gained by increasing score to a specific tier.

## Localization
Currently only supports English - but I tried to localize everything in case someone wanted to add other languages in the future.

## Basic testing with

*  Space Exploration
*  AAI Industry - if AAI Industry is installed, the glass from that mod replaces my glass in my recipes.
*  I do not change other mods logic whatsoever.


