package com.example.app

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.support.beans
import org.springframework.web.reactive.function.server.ServerResponse
import org.springframework.web.reactive.function.server.router

@SpringBootApplication
class AppApplication

fun main(args: Array<String>) {
	runApplication<AppApplication>(*args) {

		addInitializers(beans {
			bean {
				router {
					GET("/hello") {
						ServerResponse.ok().bodyValue("Hello, world!")
					}
				}
			}
		})
/*		addInitializers(beans {
			bean {
				ApplicationListener<ApplicationReadyEvent> {
					val dbc = ref<DatabaseClient>()
					val cr = ref<CustomerRepository>()
					ClassPathResource("/schema.sql").inputStream.use {
						InputStreamReader(it).use { ir ->
							val sql = ir.readText()
							dbc
									.execute(sql).fetch().rowsUpdated()
									.thenMany(cr.saveAll(Flux.just(Customer(null, "A"), Customer(null, "B"))))
									.thenMany(cr.findAll())
									.subscribe { println(it) }
						}
					}

				}
			}
			bean {
				val repo = ref<CustomerRepository>()
				router {
					GET("/customers") {
						ServerResponse.ok().body(repo.findAll())
					}
				}
			}
		})*/
	}
}

//interface CustomerRepository : ReactiveCrudRepository<Customer, Int>
//data class Customer(@Id var id: Int?, val name: String)