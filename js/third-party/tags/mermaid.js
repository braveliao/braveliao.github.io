document.addEventListener("page:loaded",()=>{let e=document.querySelectorAll("pre > .mermaid");e.length&&NexT.utils.getScript(CONFIG.mermaid.js,{condition:window.mermaid}).then(()=>{e.forEach(e=>{var t=document.createElement("div"),a=(t.className="code-container",document.createElement("div")),a=(a.innerHTML=e.innerHTML,a.className="mermaid",t.appendChild(a),CONFIG.copycode.enable&&NexT.utils.registerCopyButton(t,t,e.textContent),e.parentNode);a.parentNode.replaceChild(t,a)}),mermaid.initialize({theme:CONFIG.darkmode&&window.matchMedia("(prefers-color-scheme: dark)").matches?CONFIG.mermaid.theme.dark:CONFIG.mermaid.theme.light,logLevel:4,flowchart:{curve:"linear"},gantt:{axisFormat:"%m/%d/%Y"},sequence:{actorMargin:50}}),mermaid.run()})});