# Streaming API | Platform Events | Change Data Capture ✨

## What is Streaming API ?

- A pub/sub API that lets clients to subscribe to Salesforce data changes and custom events . Instead of polling (continuosly asking what changes were made on a scheduled basis) , Salesforce pushes notifications to subscribers the moment and event occurs .

## Important Concepts Related To Streaming API

- **PUSH vs POLL** : Tradional API s requires clients to poll repeatedly, wasting resources . Streaming keeps an open connection and server pushes data - far more efficient for real time use cases .

- **Event BUS**: Salesforce hosts a central event bus . Publishers put events on the event bus , subscribers recieves event from it. Publishers and subscribers are decoupled completely .

- **Async By Design**: Events flow Asyncronously . The publishers transaction occurs independently of subscribers processing . Subscribers can replay missed events from a retention buffer.

- **Four Channel Types**: **PushTopics** (SOQL based), **Platform Events** (custom event) , **Change Data capture** (Record changes ) and **Generic Streaming** (raw messages) - all uses same protocol.

## Typical Scnerios and Use cases :

1. External System needs to know when an Order is placed (Platform Event)
2. Sync account data changes with Data warehouse (Change Data Capture)
3. LWC dashboards shows live data updates (Platfrom Event )
4. Trigger Async Apex when custom Condition fires (Platform Evennt)
5. Audit log of all field changes (Change Data Capture)
6. Generic message Bus between Systems (Generic Streaming )

## Channel Types of Streaming APIs

- PushTopics -> **"/topic/TopicName"** -> What It carries : Records matching a SOQL query (CRUD) -> published by : Auto (DML on matching record)

- Platform Events -> **"/event/EventName\_\_e"** -> What it carries : Custom Structured messages -> Published by : Apex|Rest API | Flow | Process Builder

- Change Data Capture -> **"/data/ObjectChangeEvent"** -> What it carries : Field Level change Events for specific objects -> Published by : Auto (Any DML on enabled Objects)

- Generic Streaming -> **"/u/ChannelName"** -> What it carries : Unstructured JSON payload (manual push ) -> Published By : REST APIs (Streaming channel push)

## Concept Of Replay ID

- Every events that is put on an event bus is stamped with a monotically increasing Replay ID.Subscribers can mention a Replay Id to get /fetch past event from **"retention buffer"**. ie No data loss even if the subscriber was offline .

- **Replay ID value = -1** : It means new Events only. Only events after subscription starts are delivered .
- **Replay ID = -2** : It means FULL Replay . Replay all events in retention buffer then continue with new one .
- **Replay ID = specific ID(eg : 42)**: Replay events after this ID .
