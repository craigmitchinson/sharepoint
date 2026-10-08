import * as vl from 'vega-lite'; import * as vega from 'vega'; import fs from 'fs';
vega.expressionFunction('pbiFormat', (v, f) => { if (f.includes(',,')) return '£' + (v / 1e6).toFixed(1) + 'm'; return '£' + Math.round(v).toLocaleString('en-GB'); });
const cfg = JSON.parse(fs.readFileSync(process.argv[2] || 'ccs-config-automated-operations.json'));
const size = { 'kpi-card': [300, 150], 'gate-pipeline': [1240, 140], 'weekly-target-columns': [600, 300], 'technology-radar': [760, 440] };
fs.mkdirSync('previews', { recursive: true });
for (const f of fs.readdirSync('specs')) {
  const k = f.replace('.json', ''); const s = JSON.parse(fs.readFileSync('specs/' + f));
  const data = JSON.parse(fs.readFileSync('sample-data/' + f));
  const [w, h] = size[k] || [600, 300];
  const spec = JSON.parse(JSON.stringify(s).replaceAll('"container"', String(w)));
  if (spec.height === undefined && !spec.vconcat) spec.height = h;
  delete spec.data; spec.data = { values: data };
  try { const vg = vl.compile({ ...spec, config: { ...cfg, ...(s.config || {}), autosize: { type: 'pad' } } }).spec; const view = new vega.View(vega.parse(vg), { renderer: 'none' }); const svg = await view.toSVG(); fs.writeFileSync(`previews/${k}.svg`, svg); console.log('ok', k); } catch (e) { console.log('ERR', k, e.message.slice(0, 200)); }
}
