# Explanation of Boot Loader / Linux Kernel / Root File System

## ZynqMPのブートシーケンス
1. ステージ0ブートローダは内部ROMに存在し，PMUが実行する．
  PMUの実態はMicroBlazeでシステム全体のリソースのパワーアップ，リセットの制御および監視を担当する．
  ストレージにあるboot.binに含まれるステージ1ブートローダ(FSBL)を内部RAMにロードして，Cortex-A53を起動する．
2. Cortex-A53がFSBLを実行する．以下が実行される．
    - PSの初期設定
    - boot.binに含まれるbitstreamをPLにコンフィギュレーション
    - boot.binに含まれるステージ2ブートローダ(BL31)を内部RAMにロード
    - boot.binに含めれるステージ3ブートローダ(U-Boot)をSDRAMにロード
    - boot.binに含まれるPMUFWをPMUのRAMにロード
    - ステージ2ブートローダに制御を移す
3. Cortex-A53がBL31を実行する．自身を初期化し，RAMに常駐して各種サービスを提供する．
4. U-Bootはファイルシステム，スクリプト，環境変数などに従い，Linuxカーネルイメージ，Device Tree，ルートファイルシステムをSDRAMにロードする．

## Boot Loaderの概要
ZynqMPのBoot Loaderは，起動ストレージの第1パーティションに置かれるboot.binファイルで，以下のファイルを含む．
- FSBL
- PMUFW
- BL31
- U-Boot
- PL-Bitstream

## Linux Kernelの概要
## Root File Systemの概要
