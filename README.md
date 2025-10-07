# `.claude` 設置目錄

`.claude` 是一個用於 **程式碼研究、AI 輔助開發、工作流程自動化** 的設定與腳本集合。
本專案旨在提供 **一致化的研究流程、可重複利用的模組**，並方便團隊協作與知識管理。

## 快速開始

### 預先需求

安裝 Claude Code , 並有付費有額度可以使用

### 安裝

擇一方法安裝即可：

#### A. 手動複製

把本目錄添加到程式碼目錄下，並在目錄下用指令 `claude .` 啟動 Claude Code 即可使用

#### B. 添加為 Git 子模組

```bash
git submodule add https://github.com/fatfingererr/.claude.git .claude
git submodule update --init --recursive
```

## 使用方式

### 代理 (Agents)

#### 1. **研究階段** (Claude 指令: `/research [需求...]`)
  - 透過以下 Prompt 進行研究：
```txt
XXXXXXXX, 請使用 codebase-researcher 圍繞需求幫我分析掃描所有檔案 (跳過 .claude) 並將結果輸出到 `thoughts/shared/research` 中, 以 `YYYY-MM-DD-[description].md` 命名, 並把內容全部翻譯成繁體中文保存, 使用台灣技術用語
```
  - 輸出後, 人工主動檢視與修改研究結果

#### 2. **計畫階段** (Claude 指令: `/planning [研究計畫檔案位置]`)
  - 在研究結果修訂之後，透過以下 Prompt 進行開發計畫規劃：
```txt
根據 `thoughts/shared/research/XXX.md` 研究結果, 使用 implementation-planner 制定開發計劃, 並將計劃輸出到 `thoughts/shared/plan` 中, 以 `YYYY-MM-DD-[description].md` 命名, 並把內容全部翻譯成繁體中文保存, 使用台灣技術用語
```
  - 在開發計畫完成後, 人工檢視與修正開發計畫

#### 3. **開發階段** (Claude 指令: `/coding [開發計畫檔案位置]`)  
  - 在開發計畫修訂之後，透過以下 Prompt 進行具體開發：
```txt
根據 `thoughts/shared/plan/XXX.md` 的開發計畫, 使用 plan-implementer 進行開發, 開發完的總結摘要請輸出到 `thoughts/shared/coding` 中, 以 `YYYY-MM-DD-[description].md` 命名, 並把內容全部翻譯成繁體中文保存, 使用台灣技術用語
```
  - 人工主動檢視與修正自動化開發的程式碼變更

#### 4. **審查階段** (Claude 指令: `/review`)
  - 在開發完畢後，透過以下 Prompt 進行程式碼審查：
```txt
使用 code-reviewer 對程式碼變更進行審查，並把審查結果輸出到 `thoughts/shared/review` 中, 以 `YYYY-MM-DD-[description].md` 命名, 並把內容全部翻譯成繁體中文保存, 使用台灣技術用語
```

## 貢獻方式
1. Fork 專案並建立分支。
2. 撰寫或更新研究／計畫／程式碼內容。
3. 提交 Pull Request，並於描述中說明更動內容。

## 授權
本專案採用 MIT 授權條款。