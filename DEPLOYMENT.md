# 🚀 Deployment Guide

This guide will help you deploy your Fantasy Football Newsletter application to your domain using Kamal.

## Prerequisites

1. **Domain Name** - You need a domain name pointing to your server
2. **VPS/Server** - A server with Docker installed (Ubuntu 20.04+ recommended)
3. **Docker Hub Account** - For storing your Docker images
4. **SSH Access** - To your server

## Step 1: Prepare Your Domain

1. **Point your domain to your server:**
   - Add an A record pointing your domain to your server's IP address
   - Example: `yourdomain.com` → `YOUR_SERVER_IP`

2. **Wait for DNS propagation** (can take up to 48 hours, usually much faster)

## Step 2: Update Configuration

1. **Edit `config/deploy.yml`:**
   ```bash
   # Replace YOUR_DOMAIN_HERE.com with your actual domain
   proxy:
     ssl: true
     host: yourdomain.com
   
   # Replace your-dockerhub-username with your actual Docker Hub username
   image: your-dockerhub-username/newsletter
   username: your-dockerhub-username
   ```

2. **Update server IP:**
   ```bash
   # Replace 192.168.0.1 with your actual server IP
   servers:
     web:
       - YOUR_SERVER_IP
   ```

## Step 3: Set Up Docker Hub

1. **Create a Docker Hub account** (if you don't have one)
2. **Create an access token:**
   - Go to Docker Hub → Account Settings → Security
   - Create a new access token
   - Copy the token

3. **Set the environment variable:**
   ```bash
   export KAMAL_REGISTRY_PASSWORD=your_docker_hub_access_token
   ```

## Step 4: Prepare Your Server

1. **SSH into your server:**
   ```bash
   ssh root@YOUR_SERVER_IP
   ```

2. **Install Docker:**
   ```bash
   curl -fsSL https://get.docker.com -o get-docker.sh
   sh get-docker.sh
   ```

3. **Install Kamal:**
   ```bash
   curl -fsSL https://raw.githubusercontent.com/basecamp/kamal/main/bin/kamal | bash
   ```

4. **Set up SSH keys** (if not already done):
   ```bash
   # On your local machine
   ssh-copy-id root@YOUR_SERVER_IP
   ```

## Step 5: Deploy Your Application

1. **Build and deploy:**
   ```bash
   # Build the Docker image and push to registry
   bin/kamal deploy
   ```

2. **Monitor the deployment:**
   ```bash
   # Check deployment status
   bin/kamal status
   
   # View logs
   bin/kamal logs
   ```

## Step 6: Set Up Database

1. **Run database migrations:**
   ```bash
   bin/kamal app exec bin/rails db:migrate
   ```

2. **Seed the database:**
   ```bash
   bin/kamal app exec bin/rails db:seed
   ```

## Step 7: Verify Deployment

1. **Visit your domain:** `https://yourdomain.com`
2. **Check SSL certificate** - Let's Encrypt should automatically provision SSL
3. **Test all features** - Make sure everything works as expected

## Troubleshooting

### Common Issues

1. **SSL Certificate Issues:**
   ```bash
   # Check SSL status
   bin/kamal app exec openssl s_client -connect localhost:443
   ```

2. **Database Issues:**
   ```bash
   # Access Rails console
   bin/kamal console
   
   # Check database connection
   bin/kamal app exec bin/rails dbconsole
   ```

3. **Logs and Debugging:**
   ```bash
   # View application logs
   bin/kamal logs
   
   # Access server shell
   bin/kamal shell
   ```

### Useful Commands

```bash
# Restart the application
bin/kamal restart

# Rollback to previous version
bin/kamal rollback

# Update environment variables
bin/kamal env set RAILS_LOG_LEVEL=debug

# Access Rails console
bin/kamal console

# View server status
bin/kamal status
```

## Environment Variables

You can set additional environment variables in `config/deploy.yml`:

```yaml
env:
  clear:
    RAILS_LOG_LEVEL: info
    WEB_CONCURRENCY: 2
    JOB_CONCURRENCY: 1
```

## Security Considerations

1. **Keep your `config/master.key` secure** - Never commit it to git
2. **Use strong passwords** for your Docker Hub access token
3. **Regular updates** - Keep your server and application updated
4. **Backup your database** regularly

## Monitoring

1. **Set up monitoring** for your application
2. **Monitor server resources** (CPU, memory, disk)
3. **Set up alerts** for downtime or errors

## Next Steps

1. **Set up automated backups**
2. **Configure monitoring and alerts**
3. **Set up CI/CD pipeline** for automatic deployments
4. **Optimize performance** based on usage patterns

---

**Your application should now be live at `https://yourdomain.com`! 🎉** 