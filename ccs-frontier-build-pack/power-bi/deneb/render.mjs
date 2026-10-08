// Renders every spec in specs/ with its sample data and the Frontier config into previews/ (SVG).
// Node.js: npm i vega vega-lite, then: node render.mjs
import * as vl from 'vega-lite'; import * as vega from 'vega'; import fs from 'fs';
const cfg = JSON.parse(fs.readFileSync('ccs-config-frontier.json'));
const size = { 'frontier-kpi-card': [290, 190], 'frontier-minutes-per-summary': [600, 300], 'frontier-accepted-by-week': [600, 300], 'frontier-technology-radar': [1200, 600] };
fs.mkdirSync('previews', { recursive: true });
for (const f of fs.readdirSync('specs')) {
  const k = f.replace('.json', ''); const s = JSON.parse(fs.readFileSync('specs/' + f));
  const data = JSON.parse(fs.readFileSync('sample-data/' + f));
  const [w, h] = size[k] || [600, 300];
  const spec = JSON.parse(JSON.stringify(s).replaceAll('"container"', String(w)));
  if (spec.height === undefined || ['frontier-accepted-by-week', 'frontier-minutes-per-summary'].includes(k)) spec.height = h;
  delete spec.data; spec.data = { values: data };
  const vg = vl.compile({ ...spec, config: { ...cfg, ...(s.config || {}), autosize: { type: 'pad' } } }).spec;
  const view = new vega.View(vega.parse(vg), { renderer: 'none' });
  fs.writeFileSync(`previews/${k}.svg`, await view.toSVG()); console.log('ok', k);
}
