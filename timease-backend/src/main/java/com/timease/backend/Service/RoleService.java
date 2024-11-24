package com.timease.backend.Service;

import com.timease.backend.model.Enum.ERole;
import com.timease.backend.model.Role;
import com.timease.backend.repository.RoleRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Transactional
    public void initializeRoles() {
        // Check if the Role table is empty
        long count = roleRepository.count();

        List<Role> roles=new ArrayList<>();
        if (count == 0) {
            for(ERole role : ERole.values()){
                Role newRole = new Role(UUID.randomUUID(),role);
                roles.add(newRole);
            }
            roleRepository.saveAll(roles);
            System.out.println("Role table initialized with default roles");
        }
    }
}
