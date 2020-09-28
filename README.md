# convertnew

A small Ruby script to convert units from the command line.

`convertnew <quantity> <from_unit> <to_unit>`

Example :

`convertnew 120 m2 pi2`

Fill in the conversion table.

Use the conversion rate (ex: 1 pi2 = 0.09290304 m2)
so that : 1 <from_unit> = x <to_unit>

```
@conversion_table = [
  [ 'pi2',  'm2',       0.09290304 ],
  [ 'kg',   'livre',    2.205      ],
  [ 'euro', 'dollarca', 1.56       ],
  [ 'pi',   'm',        0.3048     ],
  [ 'in',   'm',        0.0254     ],
  [ 'yd',   'm',        0.9144     ],
  [ 'mi',   'm',     1609.344      ],
]
```
