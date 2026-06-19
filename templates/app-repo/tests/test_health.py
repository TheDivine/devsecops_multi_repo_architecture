from app.main import health, ready


def test_health_status():
    assert health() == {"status": "ok"}


def test_ready_status():
    assert ready() == {"status": "ready"}
