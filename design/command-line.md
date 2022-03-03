# 命令列

## 指令
- `sprawl` 或 `spr` 或 `bama`。
- `sprawl start`：啟動 BEAM Sprawl 。 
- `sprawl`
  - `node`：啟動一個命令列節點，並立即聯繫本機名為 'sprawl' 的節點。
- `sprawl new` （待定）
  - `node` （待定）


### 啟動 BEAM Sprawl
指令 `sprawl start` [--epmd-port 埠號]

在本機啟動名為 'sprawl' 的節點，做為本機的主控站。

選項

- `--epmd-port 埠號` 指定名為 'sprawl' 的節點落在哪個埠號；將視 epmd 在指定埠號運轉。 `--epmd-port` 效果等同於環境參數 `ERL_EPMD_PORT` 。
