from django.test import SimpleTestCase


class PageTests(SimpleTestCase):
    """Anasayfa ve Hakkımızda sayfası açılır ve ortak base.html şablonunu kullanır."""

    def test_home(self):
        r = self.client.get("/")
        self.assertEqual(r.status_code, 200)
        self.assertTemplateUsed(r, "home.html")
        self.assertTemplateUsed(r, "base.html")

    def test_about(self):
        r = self.client.get("/about/")
        self.assertEqual(r.status_code, 200)
        self.assertTemplateUsed(r, "about.html")
        self.assertTemplateUsed(r, "base.html")
