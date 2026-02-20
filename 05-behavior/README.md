# Diagrams in 05-behavior
## 01-sequence.puml
[Source](01-sequence.puml)

![Diagram](01-sequence.png)

```plantuml
@startuml
actor Timer
participant "Robot Controller" as RC
participant "Sensors" as Sensors
participant "Actuators" as Actuators
participant "Command queue" as Commands
RC -> RC : Initialize
loop Every Timer Event
    Timer -> RC ++ : Timer event
    RC -> Sensors ++ : Read sensor data
    Sensors --> RC --: Sensor values
    RC -> Commands ++: Get next command
    Commands --> RC --: Command
    RC -> RC: Think and plan
    RC -> Actuators ++: Issue control commands
    Actuators --> RC --: Acknowledge
    return
end
@enduml

```

## 02-collaboration.puml
[Source](02-collaboration.puml)

![Diagram](02-collaboration.png)

```plantuml
@startuml
object Timer
object "Robot Controller" as RC
object Sensors
object Actuators
object "Command queue" as Commands
Timer -right-> RC : 1: Triggers event
RC -up-> Sensors : 2: Read
RC <.. Sensors : Sensor values
RC -down-> Actuators : 3: Send control commands
RC <.. Actuators : Ack
RC -right-> Commands : 4: Retrieve next
RC <.. Commands : Command
@enduml

```

## 03-state.puml
[Source](03-state.puml)

![Diagram](03-state.png)

```plantuml
@startuml
[*] -> Normal
state Normal {
    [*] -> Red
    Red --> Green : after 60s
    Green --> Yellow : after 60s
    Yellow --> Red : after 5s
}
state "Blinking" as error
Normal -> error : on error
error -> Normal : reset
@enduml

```

## 04-activity.puml
[Source](04-activity.puml)

![Diagram](04-activity.png)

```plantuml
@startuml
|You|
start
:Say goodmorning;
|Partner|
:Say goodmorning;
|You|
:Boil water;
:Pour boiled water over tea;
if (Want toast?) then (yes)
    fork
        |You|
        :Put bread into toaster;
    fork again
        |Partner|
        :Take jam jar;
        |You|
        :Open jar;
        end merge
        |You|
        :Spread jam on toast;
    else (no)
    endif
    stop
    @enduml

```

## 05-timing.puml
[Source](05-timing.puml)

![Diagram](05-timing.png)

```plantuml
@startuml
clock "Cycle" as C0 with period 2
robust "Temperature Sensor" as TS
robust "Controller" as CT
robust "Fan" as F
@0
TS is Normal
CT is Idle
F is Off
@2.7
TS is Overheat
TS --> CT@4.2
@4.2
CT is "Cooling"
@4.7
F is On
@7.6
TS is Normal
TS --> CT@8.2
@8.2
CT is Idle
@8.7
F is Off
@enduml

```

