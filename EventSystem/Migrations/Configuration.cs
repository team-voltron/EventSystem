namespace EventSystem.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Models;

    public sealed class Configuration : DbMigrationsConfiguration<EventSystemDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = true;
            this.AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(EventSystemDbContext context)
        {
            if (context.Categories.Any())
            {
                return;
            }

            SeedData seedData = new SeedData();
            context.Categories.AddOrUpdate(seedData.Categories.ToArray());
            context.Events.AddOrUpdate(seedData.Events.ToArray());
        }
    }
}
