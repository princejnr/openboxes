/**
* Copyright (c) 2012 Partners In Health.  All rights reserved.
* The use and distribution terms for this software are covered by the
* Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
* which can be found in the file epl-v10.html at the root of this distribution.
* By using this software in any fashion, you are agreeing to be bound by
* the terms of this license.
* You must not remove this notice, or any other, from this software.
**/ 
package org.pih.warehouse.core

import org.pih.warehouse.auth.AuthService
import org.pih.warehouse.product.Product;

// import java.util.Date

class Synonym implements Serializable {

	def beforeInsert = {
        Synonym.withNewSession {
    		createdBy = AuthService.currentUser.get()
        }
	}
	def beforeUpdate ={
        Synonym.withNewSession {
    		updatedBy = AuthService.currentUser.get()
        }
	}
	
	String id
	String synonym
	Date dateCreated;
	Date lastUpdated;
	User createdBy
	User updatedBy
	
	static belongsTo = Product
	
	static mapping = {
		id generator: 'uuid'		
		products joinTable: [name:'product_synonym', column: 'product_id', key: 'synonym_id']
	}
	
	static hasMany = [products : Product]
	
	static constraints = {
		synonym(nullable:false, maxSize: 255)
		updatedBy(nullable:true)
		createdBy(nullable:true)
	}

}
