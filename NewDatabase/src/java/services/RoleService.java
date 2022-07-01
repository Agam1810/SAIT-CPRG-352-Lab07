
package services;

import dataaccess.RoleDB;
import java.util.List;
import models.Role;

public class RoleService {
    
    
    public List<Role> getAll() throws Exception {
        RoleDB roleDB = new RoleDB();
        List<Role> roleo = roleDB.getAll();
        return roleo;
    }

  
}
