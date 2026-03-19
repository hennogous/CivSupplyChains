---
title: Supply Chain Framework
---

# Supply Chain Framework

Each industry supply chain follows a structured progression with 5 distinct stages:

1. Materials extraction
2. Intermediate goods processing
3. Consumer goods production
4. Specialty goods production
5. Goods sales

![Supply Chain Framework overview](images/Civ%20Modding%20Projects%20-%20Supply%20Chain%20Framework.jpg)

While there are some thematic variations in how this framework is implemented, it's about 80% consistent across all 8 Quarters.

---

## High-Level Gameplay Design

A lot of strategic decisions have been frontloaded into **Quarter placement** to simplify gameplay (especially for the AI). This is the main reason for the extensive use of adjacencies — guiding players to place Quarters adjacent to resources that feed the supply chain (stage 1), as well as districts with which each Quarter later interacts.

- Adjacencies from specific resources use a custom adjacency system for more granular control
- This adjacency-driven configuration sets up the more detailed transactions between supply chain actors as the player progresses through build trees and tech/civic trees
- Decisions in the middle part of gameplay (stages 2–4) are mostly driven by opportunity cost, prioritisation of further Quarter investment, and specialist management — not detailed micro-management

Once specialty products are produced and placed into cities (stage 5), a new phase of strategic complexity enters play. Specialty products optionally replace M&C's single-resource Products, leveraging Great Works mechanics.

---

## Stage 1: Materials Extraction

Stage 1 consists of standard game improvements (Wheat Farms, Cotton Plantations, Lumber Mills, etc.) that extract materials from resources or features and sell them as inputs to stage 2 and 4 buildings.

Materials mapped to supply chains are classified as either **Base materials** or **Specialty materials**.

- Standard bonus resources are mostly classified as Base materials
- Standard luxury resources can be Base or Specialty, depending on their role in the specific supply chain
- Some resources may be a Base material in one supply chain and a Specialty material in another
- Standard luxuries retain their standard amenity effects; Quarters offer supplementary local/regional amenities
- Resources no longer provide city-wide bonuses from Industry and Corporations improvements — these are replaced by Quarter effects
- Tourism from resource Monopolies remains unchanged

**Demand transactions from stage 2 buildings:**
- +1 🔨 Production and +1 🪙 Gold to each adjacent Base materials improvement
  - M&C: +2/+2 to an Industry; +3/+3 to a Corporation
- +1 🔨 Production and +1 🪙 Gold to each adjacent Specialty materials improvement (from stage 4 buildings)
  - M&C: +2/+2 to an Industry; +3/+3 to a Corporation

![Stage 1 detail](images/Civ%20Modding%20Projects%20-%20Stage%201.jpg)

---

## Stages 2–4: Quarters

Stages 2, 3 and 4 are implemented as buildings inside 8 new Quarter districts, each dedicated to a specific industry. All Quarters:

- Unlock at **Craftsmanship**
- Can only be constructed **once per city**
- Count toward district slots
- Have a **main yield focus** (e.g. 🍎 Food for Bakers', 🎭 Culture for Tailors')
- Each Quarter constructed in a city is more expensive than the previous one, but costs do not scale by game era

### Adjacency Bonuses

Adjacency bonuses abstractly represent the Quarter's interaction with other game elements:

- +1 🔨 Production from each adjacent base and specialty materials resource in the supply chain
- +1 🪙 Gold from each adjacent district where Quarter products will be sold (stage 5), in exchange for +1 of the Quarter's main yield
- +1 🔨 Production from an adjacent Quarter that produces goods required by this industry, in exchange for +1 🪙 Gold
- +1 🔨 Production bonus for every 2 adjacent river segments (improved logistics)

**City Lights integration:**
- Rural Communities provide +1 🔨 Production (representing rural workforce availability) instead of +1 🪙 Gold, in exchange for +1 main yield
- Urban Boroughs are treated as stage 5 sales points for all Quarters (+1 🪙 Gold in exchange for +1 main yield)

![Stage 2 detail](images/Civ%20Modding%20Projects%20-%20Stage%202.jpg)

### Stage 2 — Intermediary Goods Building

Procures Base materials and processes them into intermediary goods (flour, textiles, etc.) for downstream stages and direct consumers.

- Unlocks with appropriate technologies or civics
- Low construction and maintenance cost
- Supports wide play / smaller cities by exploiting map resources

Key transactions:
- +1 🔨 Production (demand) and +1 🪙 Gold (payment) to each adjacent Base materials improvement
- +1 main yield (supply) from processing, with -2 🪙 Gold maintenance
- +1 🔨 Production and +1 🪙 Gold from the local stage 3 and 4 buildings (internal sales)
- +1 of a thematic yield to an adjacent building with a relationship to the intermediary goods during that era
- At a Medieval Era tech/civic, with an adjacent improved Base material: enables a **Service Provider** in the adjacent customer district (+1 Specialist slot, +1 Great Person point)

### Stage 3 — Consumer Goods Building

Procures intermediary goods from the stage 2 building and processes them into consumer goods (Bakery, Tailor, Carpenter) for the general city population.

- Most unlock at **Guilds**
- Requires a stage 2 building in the Quarter
- Medium construction and maintenance cost
- Provides flat yields and yields scaling with city 👤 Citizens

![Stage 3 detail](images/Civ%20Modding%20Projects%20-%20Stage%203.jpg)

Key transactions:
- +1 🔨 Production and +1 🪙 Gold to the local stage 2 building (demand/payment)
- +1 main yield (supply) at -2 🪙 Gold maintenance
- +1 👤 Citizen slot; +2 main yield and +1 🪙 Gold to Citizens in the Quarter
- +0.1 🔨 Production and +0.1 🪙 Gold per Citizen to the stage 3 building, in return for +0.1 main yield to adjacent Market
- +0.1 🔨 and +0.1 🪙 per Citizen to the stage 3 building, in return for +0.1 main yield to adjacent thematic building
- At a Renaissance Era tech/civic, with adjacent improved Base material: enables a **Service Provider** in the adjacent district
- +1 main yield to trade routes to the city, +1 🪙 Gold in return from international routes
- Access to consumer goods provides +1 🎭 Amenity in the city

### Stage 4 — Specialty Goods Building

Procures intermediary goods from stage 2 and Specialty materials from stage 1, producing specialty goods (Café, Fashion House, Luthier) for select customers.

- Most unlock at **Humanism**
- Requires a stage 2 building in the Quarter (stage 3 not required — there's a fork in the progression tree)
- High construction and maintenance cost
- Scaling yields supporting tall play and large cities
- Optionally replaces M&C single-resource Products

![Stage 4 detail](images/Civ%20Modding%20Projects%20-%20Stage%204.jpg)

Key transactions:
- +1 🔨 Production and +1 🪙 Gold to the local stage 2 building
- +1 🔨 Production and +1 🪙 Gold to each adjacent Specialty materials improvement
- +1 main yield at -3 🪙 Gold maintenance
- +1 👤 Citizen slot; +1 main yield and +1 thematic yield to Citizens
- +1 🔨 Production and +1 🪙 Gold for every 5 Citizens, in return for +1 main yield to adjacent specialty goods customer
- At an Industrial Era tech/civic, with adjacent Base and Specialty materials: enables a **Service Provider**
- +1 main yield to trade routes, +1 🪙 Gold from international routes
- Access to specialty goods provides +1 🎭 Amenity in all cities within 6 tiles

---

## Stage 5: Goods Sales

Sales of goods to buyers are described in the building sections above. The key exclusive customer is the **Aristocrat**, granted by the Commissioner governor with a Local Lords promotion. See [[social-classes|Social Classes]] for details.

![Full supply chain detail](images/Civ%20Modding%20Projects%20-%20Supply%20Chain%20Framework%20details.jpg)

---

*Continue to: [[transactions|Transactions]] | See also: [[social-classes|Social Classes]]*
