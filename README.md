## Some terraform sandboxes with AWS

Study notes and labs from the MTC in Terraform Course, https://www.udemy.com/course/terraform-certified/



###Final Provider Block for Docker:

 terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}


### To ignore other project's containers:


lifecycle {
    ignore_changes = [bridge, command,container_logs,cpu_shares,dns,dns_opts,dns_search,entrypoint,env,exit_code,gateway,group_add,hostname,id,ip_address,ip_prefix_length,ipc_mode,links,log_opts,max_retry_count,memory,memory_swap,network_data,network_mode,privileged,publish_all_ports,shm_size,sysctls,tmpfs,user,working_dir,healthcheck,labels,ports,volumes]
 
}
