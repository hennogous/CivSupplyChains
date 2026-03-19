---
title: Transactions
---

# Transactions

CSC introduces the concept of a **transaction** as an atomic pattern for the yields provided by an interaction between adjacent actors in a supply chain. It's an abstract model of Supply, Demand and Payment.

## Core Concepts

**Seller** — A building or improvement that produces and sells goods or materials.

**Buyer** — A building that purchases goods or materials, either as an end-consumer or to process them further before acting as a Seller of its output.

**Demand** is driven by the Buyer, and flows backward in the supply chain. Implemented as a +🔨 <img src='https://static.wikia.nocookie.net/civilization/images/7/74/Civ6Production.png/revision/latest/scale-to-width-down/18?cb=20200501084523' width='18' style='vertical-align:middle'/> Production yield bonus to the Seller, representing increased effort to meet demand.

**Supply** is the output of the Seller's response to demand, flowing forward in the supply chain. Implemented as a yield bonus to the Buyer — mostly the Quarter's main yield, but sometimes a more appropriate thematic yield.

**Payment** for provided Supply is implemented as a +🪙 <img src='https://static.wikia.nocookie.net/civilization/images/b/bc/Civ6Gold.png/revision/latest/scale-to-width-down/18?cb=20200501084519' width='18' style='vertical-align:middle'/> Gold yield bonus to the Seller.

> When playing with the **Taxes & Politics mod**, this automatic payment element is replaced by a player-driven Taxation concept.

---

## Transaction Ratios

The ratio between Demand, Supply and Payment represents economic principles — for example, the relative value of consumer goods vs. specialty goods.

| Stage | Demand (to Seller) | Supply (to Buyer) | Payment (to Seller) |
|-------|-------------------|-------------------|---------------------|
| Stage 1 (Base materials) | +1 🔨 per adjacent improvement | +1 main yield | +1 🪙 |
| Stage 1 (M&C Industry) | +2 🔨 | +1 main yield | +2 🪙 |
| Stage 1 (M&C Corporation) | +3 🔨 | +1 main yield | +3 🪙 |
| Stage 3 (Consumer goods) | +0.1 🔨 per Citizen | +0.1 main yield | +0.1 🪙 |
| Stage 4 (Specialty goods) | +1 🔨 per 5 Citizens | +1 main yield | +1 🪙 |

---

## Trade Route Transactions

Trade routes to a city with a Quarter always provide a fallback sales channel, even if no adjacent Market or customer building is present:

- +1 main yield to trade routes to the city (supply)
- +1 🪙 <img src='https://static.wikia.nocookie.net/civilization/images/b/bc/Civ6Gold.png/revision/latest/scale-to-width-down/18?cb=20200501084519' width='18' style='vertical-align:middle'/> Gold to the city in return from international routes (payment)

This ensures there is always a way to sell the Quarter's goods.

---

*Back to: [[supply-chain-framework|Supply Chain Framework]]*
