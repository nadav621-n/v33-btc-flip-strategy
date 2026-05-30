# v33 BTC Flip Strategy — 6-Year Backtest on Bybit

A systematic trend-following flip strategy for Bitcoin, built over 4 years of live trading and 33 iterations. Currently running on a live Bybit account.

---

## Backtest Results — BTC (6H · Bybit BTCUSDT Perpetual)

| Metric | Strategy | Buy & Hold |
|--------|----------|------------|
| Total Return | **+4,909%** | +700% |
| Period | Mar 2020 – May 2026 | Same |
| Max Drawdown | **−32%** | −77% |
| Win Rate | 21.9% | — |
| Profit Factor | **2.81** | — |
| Exchange | Bybit BTCUSDT Perp | Same |

> All fees included. No cherry-picked timeframes. Tested through the 2022 bear market, FTX collapse, 2023 recovery, and 2024–2025 bull run.

---

## The Strategy in One Sentence

**Flip strategy:** when the long signal closes, a short opens immediately. Always in a position — long during uptrends, short during downtrends.

---

## Why a 21.9% Win Rate Still Beats Buy and Hold

Most traders fixate on win rate. It's the wrong metric.

What matters is **profit factor** — the ratio of total winning dollars to total losing dollars.

At a profit factor of **2.81**, the strategy earns $2.81 for every $1 lost across all trades. That means:
- 3 small losses
- 1 large winner
- Repeat for 6 years

The math compounds in your favor, even with a "low" win rate.

---

## The 2022 Edge

In 2022, Bitcoin dropped 77% from peak to trough. Buy-and-hold portfolios were devastated.

The flip strategy:
- **Max drawdown: −32%** (vs −77% for buy-and-hold)
- **Flipped short** when BTC started trending down
- **Traded the downtrend** instead of watching a losing long bleed out

Smaller drawdowns mean you compound from a higher base when recovery comes. That's the structural edge.

---

## The Lineup: BTC, ETH, SOL

| Bot | Timeframe | Return | B&H Return | Max Drawdown | Profit Factor |
|-----|-----------|--------|------------|--------------|---------------|
| BTC Flip | 6H | +4,909% | +700% | −32% | 2.81 |
| ETH Flip | 7H | +3,212% | +240% | −43% | 2.97 |
| SOL Flip | 5H | +3,779% | +80% | −29% | 2.24 |

> Backtested on Bybit real exchange data via TradingView strategy tester. All scripts are published on TradingView — you can verify every number.

---

## Strategy Logic

- **Signal type:** RSI momentum filtering + price-based trend confirmation
- **Timeframe:** 6H (BTC), 7H (ETH), 5H (SOL)
- **Position:** Always in a trade — long or short, never flat
- **Flip mechanic:** Long close = short open (immediate). No waiting for re-entry.
- **Execution:** TradingView webhook → VPS → Bybit API

**Why 6H for BTC?**
Long enough to filter intraday noise. Short enough to capture trend moves before they fully resolve. Shorter timeframes (1H, 15M) get eaten by fees. Longer (1D) miss too many entries.

---

## Verifying the Numbers

The strategy is published on TradingView. To verify:
1. Open TradingView → Chart
2. Set exchange to Bybit, pair to BTCUSDT.P (perpetual), timeframe to 6H
3. Add the v33 BTC Flip strategy to the chart
4. Open the Strategy Tester tab
5. All metrics match what's published here

Step-by-step verification guide: [v33systematic.com/verify.html](https://v33systematic.com/verify.html)

---

## Architecture

```
TradingView Alert (webhook)
        ↓
    VPS (Linux)
        ↓
  Python script
        ↓
  Bybit REST API
        ↓
  Live perpetual order
```

No manual intervention required once deployed. The bot runs 24/7 and handles position flips automatically.

---

## Live Deployment

I've been trading independently since 2020. I automated this strategy earlier this year using Python (the core flip logic that took 33 iterations to get right is the hard part — the automation layer is clean code wrapping a proven edge).

The bot runs on my personal Bybit account with real capital. Same parameters, same strategy.

---

## Getting a Bot on Your Account

Two options:

**v33 Formula ($999)**
My proven BTC/ETH/SOL system deployed to your Bybit account. Includes VPS setup, API connection, and live in 5–7 days.

**v33 Blueprint ($1,999)**
Your own strategy, built and deployed from scratch. 30 days of support included.

Full details: [v33systematic.com/#services](https://v33systematic.com/#services)

---

## Full Analysis Pages

- [BTC Bot → v33systematic.com/btc-trading-bot.html](https://v33systematic.com/btc-trading-bot.html)
- [ETH Bot → v33systematic.com/eth-trading-bot.html](https://v33systematic.com/eth-trading-bot.html)
- [SOL Bot → v33systematic.com/sol-trading-bot.html](https://v33systematic.com/sol-trading-bot.html)
- [ROI Calculator → v33systematic.com/calculator.html](https://v33systematic.com/calculator.html)
- [Verify Yourself → v33systematic.com/verify.html](https://v33systematic.com/verify.html)

---

## Contact

📧 btc@v33systematic.com  
🌐 [v33systematic.com](https://v33systematic.com)

*Not financial advice. Past backtest performance does not guarantee future results.*
