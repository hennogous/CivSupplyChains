import { QuartzTransformerPlugin } from "../types"
import { visit } from "unist-util-visit"
import type { Root, Text, Parent } from "mdast"

const BASE = "https://static.wikia.nocookie.net/civilization/images"

const ICONS: Record<string, { url: string; alt: string }> = {
  food:       { url: `${BASE}/6/65/Civ6Food.png/revision/latest/scale-to-width-down/18?cb=20200501084516`, alt: "Food" },
  production: { url: `${BASE}/7/74/Civ6Production.png/revision/latest/scale-to-width-down/18?cb=20200501084523`, alt: "Production" },
  gold:       { url: `${BASE}/b/bc/Civ6Gold.png/revision/latest/scale-to-width-down/18?cb=20200501084519`, alt: "Gold" },
  science:    { url: `${BASE}/7/79/Civ6Science.png/revision/latest/scale-to-width-down/18?cb=20200501084526`, alt: "Science" },
  culture:    { url: `${BASE}/2/2a/Civ6Culture.png/revision/latest/scale-to-width-down/18?cb=20200501084510`, alt: "Culture" },
  faith:      { url: `${BASE}/8/82/Civ6Faith.png/revision/latest/scale-to-width-down/18?cb=20200501084513`, alt: "Faith" },
  tourism:    { url: `${BASE}/5/5b/Tourism6.png/revision/latest/scale-to-width-down/18?cb=20200501084529`, alt: "Tourism" },
  housing:    { url: `${BASE}/a/ae/Housing6.png/revision/latest/scale-to-width-down/18?cb=20200428064015`, alt: "Housing" },
  amenity:    { url: `${BASE}/6/65/Amenities6.png/revision/latest/scale-to-width-down/18?cb=20200427170306`, alt: "Amenity" },
  amenities:  { url: `${BASE}/6/65/Amenities6.png/revision/latest/scale-to-width-down/18?cb=20200427170306`, alt: "Amenities" },
  citizen:    { url: `${BASE}/8/87/Citizen6.png/revision/latest/scale-to-width-down/18?cb=20200427170306`, alt: "Citizen" },
  loyalty:    { url: `${BASE}/d/dd/Loyalty_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20190228082016`, alt: "Loyalty" },
  influence:  { url: `${BASE}/c/c4/Influence_point_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140613`, alt: "Influence" },
  "great-merchant": { url: `${BASE}/9/90/Great_Merchant_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140702`, alt: "Great Merchant" },
  "great-scientist": { url: `${BASE}/b/b0/Great_Scientist_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140723`, alt: "Great Scientist" },
  "great-artist":    { url: `${BASE}/b/b3/Great_Artist_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140657`, alt: "Great Artist" },
  "great-engineer":  { url: `${BASE}/d/d5/Great_Engineer_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140701`, alt: "Great Engineer" },
  "great-general":   { url: `${BASE}/b/bc/Great_General_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140706`, alt: "Great General" },
  "great-admiral":   { url: `${BASE}/0/09/Great_Admiral_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140655`, alt: "Great Admiral" },
  "great-prophet":   { url: `${BASE}/4/4d/Great_Prophet_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140720`, alt: "Great Prophet" },
  "great-musician":  { url: `${BASE}/e/e3/Great_Musician_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140715`, alt: "Great Musician" },
  "great-writer":    { url: `${BASE}/f/f2/Great_Writer_icon_%28Civ6%29.png/revision/latest/scale-to-width-down/18?cb=20200505140728`, alt: "Great Writer" },
}

const SHORTHAND_REGEX = /\{\{([a-z-]+)\}\}/g

export const YieldIcons: QuartzTransformerPlugin = () => {
  return {
    name: "YieldIcons",
    markdownPlugins() {
      return [
        () => (tree: Root) => {
          visit(tree, "text", (node: Text, index: number | null, parent: Parent | null) => {
            if (!SHORTHAND_REGEX.test(node.value)) return
            SHORTHAND_REGEX.lastIndex = 0

            const newNodes: any[] = []
            let lastIndex = 0
            let match: RegExpExecArray | null

            while ((match = SHORTHAND_REGEX.exec(node.value)) !== null) {
              const key = match[1].toLowerCase()
              const icon = ICONS[key]

              if (match.index > lastIndex) {
                newNodes.push({ type: "text", value: node.value.slice(lastIndex, match.index) })
              }

              if (icon) {
                newNodes.push({
                  type: "html",
                  value: `<img src="${icon.url}" alt="${icon.alt}" title="${icon.alt}" width="18" style="vertical-align:middle;display:inline;margin:0 1px"/>`,
                })
              } else {
                newNodes.push({ type: "text", value: match[0] })
              }

              lastIndex = match.index + match[0].length
            }

            if (lastIndex < node.value.length) {
              newNodes.push({ type: "text", value: node.value.slice(lastIndex) })
            }

            if (parent && index !== null && newNodes.length > 0) {
              parent.children.splice(index, 1, ...newNodes)
            }
          })
        },
      ]
    },
  }
}
