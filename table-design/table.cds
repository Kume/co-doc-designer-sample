fileMap:
  fileName: index.yml
  children:
  - type: map
    path: tables
    directory: tables
dataSchema:
  type: fixed_map
  label: 全体定義
  items:
    tables:
      type: map
      label: テーブル定義一覧
      item:
        type: fixed_map
        label: テーブル定義
        dataLabel: "{{label}}"
        items:
          label:
            type: string
            label: 名前
          description:
            type: string
            label: 説明
          columns:
            type: map
            label: カラム定義一覧
            item:
              type: fixed_map
              label: カラム定義
              items:
                label: 
                  type: string
                  label: 名前
                type:
                  type: string
                  label: 型
                  in:
                    - INT
                    - SMALLINT
                    - VARCHAR
                    - TEXT
                    - DATETIME
                length:
                  type: number
                  label: データ長
                nullable:
                  type: boolean
                  label: NULL許可
                description:
                  type: string
                  label: 説明
          indexes:
            type: map
            label: インデックス一覧
            item:
              type: fixed_map
              label: インデックス
              items:
                unique:
                  type: boolean
                  label: ユニーク
                column1:
                  type: string
                  label: 対象カラム(1)
                  in:
                    - path: ../../../columns/*/$key
                column2:
                  type: string
                  label: 対象カラム(2)
                  in:
                    - path: ../../../columns/*/$key
                column3:
                  type: string
                  label: 対象カラム(3)
                  in:
                    - path: ../../../columns/*/$key
                column4:
                  type: string
                  label: 対象カラム(4)
                  in:
                    - path: ../../../columns/*/$key
                column5:
                  type: string
                  label: 対象カラム(5)
                  in:
                    - path: ../../../columns/*/$key
                description:
                  type: string
                  label: 説明
uiRoot:
  type: tab
  contents:
    - type: contentList
      key: tables
      content:
        type: form
        contents:
          - type: text
            label: 物理名
            key: $key
          - type: text
            key: label
          - type: text
            key: description
            multiline: true
          - type: table
            key: columns
            contents:
              - type: text
                label: 物理名
                key: $key
              - type: text
                key: label
              - type: select
                key: type
              - type: number
                key: length
              - type: checkbox
                key: nullable
              - type: text
                key: description
                multiline: true
          - type: table
            key: indexes
            contents:
              - type: text
                label: 物理名
                key: $key
              - type: checkbox
                key: unique
              - type: select
                key: column1
              - type: select
                key: column2
              - type: select
                key: column3
              - type: select
                key: column4
              - type: select
                key: column5
              - type: text
                key: description
                multiline: true
