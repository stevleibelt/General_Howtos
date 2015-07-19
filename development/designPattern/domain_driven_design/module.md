# module

* if your model is telling a story, the modules are the chapters
* separate meaningful concepts in the model

## example

### e commerce shop

* each module has its own, meaningful rest api

* billing
    * composer.json
    * composer.lock
    * source
        * MyCompany
            * Domain
                * Model
                    * Bill
                    * Order
                    * Waybill
                * Service
            * Infrastructure
                * Logging
                * Messaging
                * Persistence
                    * CQRS
                        * BillRepository.php
                        * OrderRepository.php
                        * WaybillRepository.php
                    * InMemory
                        * BillRepository.php
                        * OrderRepository.php
                        * WaybillRepository.php
                    * Propel
                        * BillRepository.php
                        * OrderRepository.php
                        * WaybillRepository.php
                    * Redis
                        * BillRepository.php
                        * OrderRepository.php
                        * WaybillRepository.php
    * test
* cart
    * composer.json
    * composer.lock
    * source
    * test
* catalog
    * composer.json
    * composer.lock
    * source
    * test
* inventory
    * composer.json
    * composer.lock
    * source
    * test

## notes

* if you implement CQRS (and mixing technologies), best is to 
