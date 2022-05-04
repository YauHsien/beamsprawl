# BEAM Sprawl
The BEAM-Sprawl is to glue nodes into a interconnected network.

## 問題
我們可以啟動許多 ERTS 節點。那些節點可以互相知道，也可以互相不知道。當我在維運時，手上需要有個儀表板能幫忙列出節點清單，以及有哪個設備（包括 `gen_server` 與 `MembraneWebRTC.Endpoint` 和 `MembraneWebRTC.Peer` ）配在哪個節點上。

ERTS nodes 意味分散式網路。儀表板須為一種監管設備，而不是中央控制設備。

## 任務
**beamsprawl** (BEAM-Sprawl) 是個 ERTS 網的監管架構。本工具定位為陪同在分散網路系統旁的骨幹與終端。

內容包括：

- 一組程式庫，功能足以協助將監管設備嵌入受控管的 ERTS 節點。
- 各節點自行維護一份網路的節點與用途清單。
- 一份使用者界面，當使用者界面接上 ERTS 網時，可讀取全網的節點與用途清單。

## `git` 分流
- `main` ：說明與設計。
- `elixir` ： Elixir 實作。
- `erlang` ： Erlang 實作。

## 命名
名稱的 "sprawl" 取自科幻小說作家 Willam Gibson 小說 "Neuromancer" 的一處地帶名稱 *The Sprawl* ，是指三次世界大戰之後美國東岸由波士頓到亞特蘭大的都會帶。 `beamsprawl` 命名借用 *The Sprawl* 的骨幹意味，以及科幻小說的近未來感。

## Application `:sprawl`

- [**The application** `:sprawl`](sprawl/)
- [Example application](example/)

## Application: `:node_resources`

- [**The application** `:node_resources`](node_resources/)
- [Example application](example/)

## Reverse proxy toolset

- [**The application** :sprawl\_roulette](sprawl_roulette/)
- [**The application** :sprawl\_deck](sprawl_deck/)
- [**Library** :sprawl\_message](sprawl_message/)
- [**Library** :sprawl\_roulette_client](sprawl_roulette_client/)
