locals {
    env = {
        DEV ="dev"
        PREPROD = "preprod"
        PROD = "prod"
    }
    resource_prefix = {
        DEV ="microservicies-networking"
        PREPROD = "microservicies-networking"
        PROD = "microservicies-networking"
    }
    cidr = {
        DEV = "192.168.1.0/24"
        PREPROD = "192.168.3.0/24"
        PROD = "192.168.4.0/24"
    }
    private_subnets = {
        DEV = ["192.168.1.240/28", "192.168.1.144/28", "192.168.1.160/28"]
        PREPROD = ["192.168.3.128/28", "192.168.3.144/28", "192.168.3.160/28"]
        PROD = ["192.168.4.128/28", "192.168.4.144/28", "192.168.4.160/28"]
    }

    public_subnets = {
        DEV = ["192.168.1.176/28", "192.168.1.192/28", "192.168.1.208/28"]
        PREPROD = ["192.168.3.176/28", "192.168.3.192/28", "192.168.3.208/28"]
        PROD = ["192.168.4.176/28", "192.168.4.192/28", "192.168.4.208/28"]
    }
}