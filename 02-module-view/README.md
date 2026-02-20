# Diagrams in 02-module-view
## 01-class-diagram.puml
[Source](01-class-diagram.puml)

![Diagram](01-class-diagram.png)

```plantuml
@startuml
interface Payment {
    timestamp: DateTime
}
abstract class BasePayment extends Payment
class Cash extends BasePayment
class CreditCard extends BasePayment
class BankTransfer extends BasePayment
class Invoice {
    amount: Money
    status(): Status
}
Invoice - Payment : > paid
@enduml
```

## 02-package-diagram.puml
[Source](02-package-diagram.puml)

![Diagram](02-package-diagram.png)

```plantuml
@startuml
package Core {
    package Domain { }
    package Util { }
}
package UI {
    package CLI { }
    package Web { }
    package JavaFXUI { }
}
package JavaFX <<library>> {
}
package React <<library>> {
}
CLI ..> Domain
Web ..> Domain
JavaFXUI ..> Domain
Domain ..> Util
JavaFXUI ..> JavaFX
Web ..> React
@enduml


```

## 03-class-and-package.puml
[Source](03-class-and-package.puml)

![Diagram](03-class-and-package.png)

```plantuml
@startuml
package "E-shop" {
    package "Accounting" {
        class Invoice {
            amount: Money
            status(): Status
        }
        interface Payment {
            timestamp: DateTime
        }
        abstract class BasePayment extends Payment
        class Cash extends BasePayment
        class CreditCard extends BasePayment
        class BankTransfer extends BasePayment
        Invoice - Payment : > paid
    }
    package "Util" {
        class Money {}
    }
    package "Shopping" {
        class ShoppingCart {
            coupons : Coupon[]
            total(): Money
        }
        class CartItem {
            amount: Int
        }
        interface Product {
            id : SKU
            price : Money
        }
        class PhysicalProduct {}
        class DigitalProduct {}
        ShoppingCart *-- "0..*" CartItem
        CartItem - "1" Product : > orderedProduct
        Product <|-- PhysicalProduct
        Product <|-- DigitalProduct
    }
    Accounting ..> Util
    Shopping ..> Util
}
@enduml
```

## 04-data-types-json.puml
[Source](04-data-types-json.puml)

![Diagram](04-data-types-json.png)

```plantuml
@startjson
#highlight "phoneNumbers"
#highlight "phoneNumbers" / "0"
#highlight "phoneNumbers" / "0" / "number"
{
    "firstName": "John",
    "lastName": "Smith",
    "isAlive": true,
    "age": 28,
    "address": {
        "streetAddress": "21 2nd Street",
        "city": "New York",
        "state": "NY",
        "postalCode": "10021-3100"
    }
    ,
    "phoneNumbers": [
    {
        "type": "home",
        "number": "212 555-1234"
    }
    ,
    {
        "type": "office",
        "number": "646 555-4567"
    }
    ],
    "children": [],
    "spouse": null
}
@endjson

```

