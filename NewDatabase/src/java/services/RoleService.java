
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

    
     public Role get(String role_name) throws Exception {
        RoleDB roleDB = new RoleDB();
        Role role = roleDB.get(role_name);
        return role;
    }
  
}
