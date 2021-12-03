# System Design Concepts 

<!-- toc -->

## [L1: What is a distributed system](https://youtu.be/7VbL89mKK3M)

What are 3 attributes of a Centralized system?
- Simpler
- Easier to understand
- Often faster for a single
    - Limited network calls

What are 3 attributes of a Distributed system?
- More robust, tolerates failures
- More scalable, supports multi users
- More complex

Examples of Distributed Systems:
- DNS
    - Distributed table of hostnames to IP addresses
    - There's always a computer close to you for lookups
- Email (SMTP)
    - Mail servers around the world, relaying mail
- Phone networks
    - Distributed Systems problems solved to build land line network
    - and later, cell phone network
- Cars
    - CANbus network
        - If radio breaks, shouldn't affect other critical systems
- Traffic light and train signals
    - fault tolerant 
- Airplanes
    - avionics joined via RS232 bus
    - fault tolerant strategy
        - in GPS failure, relies on pilot


## [L2: Why build a distributed system?](https://youtu.be/pMQzLVK39Kk)



## [L16: The CAP Theorem](https://youtu.be/k-Yaq8AHlFA)

What does CAP in CAP Theorem stand for?
- Consistent
- Available
- Partition Tolerance

What does CAP Theorem state?
- Tradeoff between consistency and availability with distributed systems

Say I have 2 data stores. In a happy path scenario, a user updates one (a primary) and the change is replicated to the other (a replica). How would you design a consistent system when the replicated data store fails? (CAP Theorem)
- A consistent system would not allow the primary data store to be updated when the second data store is offline.

Say I have 2 data stores. In a happy path scenario, a user updates one (a primary) and the change is replicated to the other (a replica). How would you design an available system when the replica data store fails? (CAP Theorem)
- An available system would allow the primary data store to be updated, and worry about syncing up the replica store when it's back online.
